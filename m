Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03FFD606A325
	for <ath12k@archiver.kernel.org>; Thu, 19 Nov 2026 19:17:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Jy3P6f/4;
	dkim=pass (2048-bit key) header.d=pi0.com header.i=@pi0.com header.a=rsa-sha256 header.s=google header.b=L8UkrMvn
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=QqQuDCPqQsXgOI2rM4tmWqkVLy+TOCVD55J+8eSsoec=; b=Jy3P6f/4ygrh/k8bX+etbc59T1
	qv3mNMevdecWOTnsRM8KsBpfnYKUpZcP2L3swxJlKjOvM5AYEbIluahxLRGAbUYWvQzWFO1de5qLD
	sdMpsJ/xm7W1GG823fEvU+mKD0hAjTAnpZ5KqL9Pa808nANqle3LFos8mJAPdq+v1q2EP8mBokzpY
	JzLYd5U+5LYT56RvCF9fknhVnFsnlD15XtXeUW9yT4hazt9s5/S/np/hokwlPkTnCou2ancjjBBwk
	zX3HGbNTWUecAhnxs/hSgJuG7UwW5gDbm8/WYTvBP0jgVi8AEmB97sn5GQUZh2tZmxL8IHcmv+/XG
	iyJ/VkGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU7dl-0000000DAz0-1WdE;
	Thu, 19 Nov 2026 19:17:49 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU7dj-0000000DAxm-2kz6
	for ath12k@lists.infradead.org;
	Thu, 19 Nov 2026 19:17:48 +0000
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-3b09a83d12aso117198a91.2
        for <ath12k@lists.infradead.org>; Thu, 19 Nov 2026 11:17:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pi0.com; s=google; t=1795115866; x=1795720666; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=QqQuDCPqQsXgOI2rM4tmWqkVLy+TOCVD55J+8eSsoec=;
        b=L8UkrMvnov1AmEcS5KIppa+64D5zwEWij9mZJ+DbPv9oNhCkRxqHOZs5Zo2lLKw9r1
         27QnWeqZQIHNnEPbm2hjfWs0YHkxnXUCV1MLOaUOI/W9YMFM5SrDwvSduOn3sw3l8isM
         wj2n9epzcPELOezB0PYrPegNIPo2QApH/Wn7EwjB8I1SHw73W8KZt1HA53WSlAI2JUuq
         f8QhrhBNLRfncR9aGPIFkAc1aGxUyiI/tvq+odd5xRgDiLCMq6barSUwR0LLre9sOpjW
         kXWoNiB+Zo+JRrU3q9ToTFseFdDiAzhFel8vGzwGHVtY1W8sEezLmAaszHvtJ33LGCwe
         +ggg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795115866; x=1795720666;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QqQuDCPqQsXgOI2rM4tmWqkVLy+TOCVD55J+8eSsoec=;
        b=pA7vVS0yABNRL0hdHtqkp3MhxNwKHmVPEu7YXj/m4Y7uDVY98aExzrwglm5cPbGWpX
         WxfjFQQqCysL5ErCEm7/JF3UQdGyWMcSmrpYD8p2Xup/7DCPJy8tpkOKmxoYTGcbdf1i
         w41+Y9o1257vJgngWe2oIoA0ZOoDHMOzXdCZypjGOeI+degUOfzDGHa8lZIpq/MCEvs0
         +YeWOBU1YRqzZFKhEflEIZKUcZUaDph2ETZ4mHflrAAn0ZIsx20nLtI4+zsMmpO7vIp4
         9K/NBXXhhvDx73lyic20tiTAtZY0+WNn8EQn4zTIp5n4tpctJW9wyPvkPH++b2794eze
         41/A==
X-Gm-Message-State: APuU4Z8kQNMqw28wpDVO/EFfVt7v73HcYZJFiKxBIqLyc6tRq8hVqKUq
	zOHkLVEkhOaNCddpWHi6LaBQpVh8z3/J6+0kSyRn0nslsY35V828vIy/VDx1GpNbzV3LTbGkWmo
	/bKf98Naq/Q==
X-Gm-Gg: AZFdTZca/W0TbgQkuaV3ox0srXLNoHJhOopwBSmeuRvj7olsV2bljBqPL7CsEAdUvf2
	yOJ0KPTzKxyyezzCg8dDqncgC1Q2wbb4bTNB4MyXoQC0kGv65q3WaS7A6GrauqnqYQ3A3xaVZ1d
	UwO5KTrYOArlWDQGDzpxY7XFnCdtUQmNcptbeAHGkO5KAbkZ0I5SyBOqSwzArvc4sOR42T5c7Rp
	0NdTGT7r7V91pyEG41BWLKn6SopslHQixavMa7UvE6PQlGFPA2HcK7kg41anHB8sW+zWvwfBB3j
	rhS04R7kdgluBJCq9MNPfyPOqUvMPnY0iETxSxlFP8wEnoEB+M9RwxVSDye4dGCXbInxL06f9xu
	EpBpMH9T6eW/QWtAAf/uOzDty9uFjw3AYgcBu5t3u6gHnV5z7hOVCsbHh7ThXOAUsDu0zauNRfg
	tvNge8xz4AG0MqnW44gz8b+0NHadb9+Ioq4CcCuYJRlsg9HvEh/vB5oTk2GEN9IPHds+ys+0PFm
	XhbG4IlS1wHtbi1kbCo+5Wy/6I1hlLC4WGi6gxZMEh4RtE94kpT+C4VWv6fdI58/xa2ZUlzG38v
	YkpaDPXoNHBNCYrY6Asn8LYFcIvNdm0+vg9Kv/pUAEFB129VCSBKbzpSps5dUAvjqSKUIf5CMqi
	NhYkqRwiyrckMsFjC/Lj8NA72ocGs3Li8sBFBC/GgrqPi15CXSp9KiZXM8kx/PuO2
X-Received: by 2002:a17:90b:3e81:b0:3ad:6090:a190 with SMTP id 98e67ed59e1d1-3b41c9559f5mr292265a91.41.1795115865629;
        Thu, 19 Nov 2026 11:17:45 -0800 (PST)
Received: from apex.tail2509b0.ts.net (63-119-237-24.gci.net. [24.237.119.63])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b405ec698dsm3809796a91.14.2026.11.19.11.17.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 11:17:45 -0800 (PST)
From: Jonathan Wolf <wolf@pi0.com>
To: ath12k@lists.infradead.org
Cc: baochen.qiang@oss.qualcomm.com,
	jjohnson@kernel.org,
	vasanthakumar.thiagarajan@oss.qualcomm.com,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH ath-current v3] wifi: ath12k: parse the nested DBS/SBS capability TLV
Date: Thu, 19 Nov 2026 10:17:16 -0900
Message-ID: <20261119191717.215161-1-wolf@pi0.com>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_111747_723358_2D86473A 
X-CRM114-Status: GOOD (  15.04  )
X-Spam-Score: -1.8 (-)
X-BeenThere: ath12k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath12k.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/ath12k/>
List-Post: <mailto:ath12k@lists.infradead.org>
List-Help: <mailto:ath12k-request@lists.infradead.org?subject=help>
List-Subscribe: <https://lists.infradead.org/mailman/listinfo/ath12k>,
 <mailto:ath12k-request@lists.infradead.org?subject=subscribe>
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The DBS/SBS capability in WMI_SERVICE_READY_EXT2_EVENTID is inside a
WMI_TAG_ARRAY_STRUCT. The array payload starts with the inner TLV
header. Casting that pointer to struct ath12k_wmi_dbs_or_sbs_cap_params
makes ath12k read hw_mode_id as sbs_lower_band_end_freq.

On WCN7850 with hardware mode 5 and a 5900 MHz cutoff, this gives an
SBS frequency range of 4900-5 MHz. The driver can then map the 5 GHz
and 6 GHz links to the same MAC and request deactivation of one link.

Use ath12k_wmi_tlv_iter() to reach the capability payload. Check the
tag and minimum payload length before converting the cutoff to CPU byte
order. Clear the cached cutoff before parsing so an empty array leaves
it at zero.

Fixes: 241d130f1419 ("wifi: ath12k: parse and save sbs_lower_band_end_freq from WMI_SERVICE_READY_EXT2_EVENTID event")
Signed-off-by: Jonathan Wolf <wolf@pi0.com>
---
Changes in v3:
- Follow Baochen's suggestion to decode and log the single capability
  in the iterator callback. Drop the first-record pointer and wrapper.
  Clear the cutoff before walking the array to handle an empty array.

Changes in v2:
- Warn on a nested parse error. Move the cutoff assignment and debug
  message into a helper and separate Tested-on from the trailers.

v2: https://lore.kernel.org/ath12k/20261118204307.3154270-1-wolf@pi0.com/
v1: https://lore.kernel.org/ath12k/20261118012321.2861920-1-wolf@pi0.com/

Built ath12k for arm64. A host test of the event parser reproduces the
5 MHz result on ath-current and gets 5900 MHz with v3. This revision
has not yet been run on hardware.


 drivers/net/wireless/ath/ath12k/wmi.c | 32 +++++++++++++++++++++------
 drivers/net/wireless/ath/ath12k/wmi.h |  1 +
 2 files changed, 26 insertions(+), 7 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/wmi.c b/drivers/net/wireless/ath/ath12k/wmi.c
index 75b259990c..9b1de1ec06 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.c
+++ b/drivers/net/wireless/ath/ath12k/wmi.c
@@ -5781,11 +5781,27 @@ static int ath12k_wmi_update_hw_mode_list(struct ath12k_base *ab)
 	return 0;
 }
 
+static int ath12k_wmi_tlv_dbs_sbs_caps(struct ath12k_base *ab, u16 tag,
+				       u16 len, const void *ptr, void *data)
+{
+	const struct ath12k_wmi_dbs_or_sbs_cap_params *caps = ptr;
+
+	if (tag != WMI_TAG_DBS_OR_SBS_CAP_EXT || len < sizeof(*caps))
+		return -EPROTO;
+
+	ab->wmi_ab.sbs_lower_band_end_freq =
+		le32_to_cpu(caps->sbs_lower_band_end_freq);
+
+	ath12k_dbg(ab, ATH12K_DBG_WMI, "sbs_lower_band_end_freq %u\n",
+		   ab->wmi_ab.sbs_lower_band_end_freq);
+
+	return 0;
+}
+
 static int ath12k_wmi_svc_rdy_ext2_parse(struct ath12k_base *ab,
 					 u16 tag, u16 len,
 					 const void *ptr, void *data)
 {
-	const struct ath12k_wmi_dbs_or_sbs_cap_params *dbs_or_sbs_caps;
 	struct ath12k_wmi_pdev *wmi_handle = &ab->wmi_ab.wmi[0];
 	struct ath12k_wmi_svc_rdy_ext2_parse *parse = data;
 	int ret;
@@ -5840,12 +5856,14 @@ static int ath12k_wmi_svc_rdy_ext2_parse(struct ath12k_base *ab,
 		} else if (!parse->htt_msdu_idx_to_qtype_map_done) {
 			parse->htt_msdu_idx_to_qtype_map_done = true;
 		} else if (!parse->dbs_or_sbs_cap_ext_done) {
-			dbs_or_sbs_caps = ptr;
-			ab->wmi_ab.sbs_lower_band_end_freq =
-				__le32_to_cpu(dbs_or_sbs_caps->sbs_lower_band_end_freq);
-
-			ath12k_dbg(ab, ATH12K_DBG_WMI, "sbs_lower_band_end_freq %u\n",
-				   ab->wmi_ab.sbs_lower_band_end_freq);
+			ab->wmi_ab.sbs_lower_band_end_freq = 0;
+			ret = ath12k_wmi_tlv_iter(ab, ptr, len,
+						  ath12k_wmi_tlv_dbs_sbs_caps, NULL);
+			if (ret) {
+				ath12k_warn(ab, "failed to parse DBS/SBS capabilities WMI TLV: %d\n",
+					    ret);
+				return ret;
+			}
 
 			ret = ath12k_wmi_update_hw_mode_list(ab);
 			if (ret) {
diff --git a/drivers/net/wireless/ath/ath12k/wmi.h b/drivers/net/wireless/ath/ath12k/wmi.h
index b508aa759b..94bb6854b0 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.h
+++ b/drivers/net/wireless/ath/ath12k/wmi.h
@@ -2032,6 +2032,7 @@ enum wmi_tlv_tag {
 	WMI_TAG_PDEV_SET_BIOS_SAR_TABLE_CMD = 0x3D8,
 	WMI_TAG_PDEV_SET_BIOS_GEO_TABLE_CMD = 0x3D9,
 	WMI_TAG_PDEV_SET_BIOS_INTERFACE_CMD = 0x3FB,
+	WMI_TAG_DBS_OR_SBS_CAP_EXT = 0x400,
 	WMI_TAG_RSSI_DBM_CONVERSION_PARAMS_INFO_FIXED_PARAM = 0x427,
 	WMI_TAG_RSSI_DBM_CONVERSION_PARAMS_INFO,
 	WMI_TAG_RSSI_DBM_CONVERSION_TEMP_OFFSET_INFO,

base-commit: b1ed5a45b994a6473ca1cf34f35a1bf87f1d8e2a
-- 
2.56.0


