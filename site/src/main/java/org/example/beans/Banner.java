package org.example.beans;
/*
 * Copyright 2014 Hippo B.V. (http://www.onehippo.com)
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *  http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import org.onehippo.cms7.essentials.dashboard.annotations.HippoEssentialsGenerated;
import org.hippoecm.hst.content.beans.Node;
import org.hippoecm.hst.content.beans.standard.HippoHtml;
import org.hippoecm.hst.content.beans.standard.HippoGalleryImageSet;
import org.hippoecm.hst.content.beans.standard.HippoBean;

@HippoEssentialsGenerated(internalName = "hippodocker:bannerdocument")
@Node(jcrType = "hippodocker:bannerdocument")
public class Banner extends BaseDocument {
	@HippoEssentialsGenerated(internalName = "hippodocker:title")
	public String getTitle() {
		return getProperty("hippodocker:title");
	}

	@HippoEssentialsGenerated(internalName = "hippodocker:content")
	public HippoHtml getContent() {
		return getHippoHtml("hippodocker:content");
	}

	@HippoEssentialsGenerated(internalName = "hippodocker:image")
	public HippoGalleryImageSet getImage() {
		return getLinkedBean("hippodocker:image", HippoGalleryImageSet.class);
	}

	@HippoEssentialsGenerated(internalName = "hippodocker:link")
	public HippoBean getLink() {
		return getLinkedBean("hippodocker:link", HippoBean.class);
	}
}
