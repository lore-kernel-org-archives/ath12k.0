Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E25B60A2610
	for <ath12k@archiver.kernel.org>; Wed, 18 Nov 2026 20:43:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=k/DLykVt;
	dkim=pass (2048-bit key) header.d=pi0.com header.i=@pi0.com header.a=rsa-sha256 header.s=google header.b=C28w4G7f
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=2pYlTwk2wGwugpvwvlYaqR3MfohcECSz7ZDOgYENGZs=; b=k/DLykVtxaBcYj/yprTCimJSce
	Lv9eXOl5LkKxjCfgnLHiNbrWlWmfRXku5ylPvStM+3EgpL0F2ywuXU2OkGq+MsfEB/v7cQMjFiS1l
	aHzuXrm/GyntxrNEcnFgKUVZMELDwG6HTkmIvY5hcl2CecAjw+ZV5/3diSV95ktSl+2Sp/4J7vlqS
	uWbTpYQ4DsIE9bojWxhsn7AzH4RyTO4AJ3mv1/N0dHfLXMLbu8GiSY/xj5Iaq9IrxFk861zL1It+M
	avDOVVE3dxssrX4jATbFZf4v4lTt5yv2yjD3+sRVYcCY9BMldJK62KjzNH+MLI0WgtcWjKUPPhefI
	s4JaRNkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTmVK-0000000AFh8-2dKB;
	Wed, 18 Nov 2026 20:43:42 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTmVG-0000000AFgZ-1JLf
	for ath12k@lists.infradead.org;
	Wed, 18 Nov 2026 20:43:39 +0000
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-3b155f50c24so1317090a91.3
        for <ath12k@lists.infradead.org>; Wed, 18 Nov 2026 12:43:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pi0.com; s=google; t=1795034617; x=1795639417; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2pYlTwk2wGwugpvwvlYaqR3MfohcECSz7ZDOgYENGZs=;
        b=C28w4G7f28koYe3WbIllWtJjp0L7e0de3j/D8RlQTiN5XaYn1HGML/LaRfycbTIuyn
         /kr6aJ4ED15atABS4woLJpVdyif0nPggVbM+i/eNeEiIwka8EsTsJNk2HdtuC+Z1rjp9
         y/V6lw9NBnmYL57QWV7ooU+SnC0rdLHN1UZxUIDBMHce1QcFbdR7jZ54Tn1WQhUxh/XS
         v8ZlLNvTTrt+Rd89fhzpaO3MWOT7XX2ALbHa6Ntfq1Uv3PJ7+QIojkfErIZ3V5XrdiZ+
         kgmJ5DMSAA5+sFNvbYh3OjdFsI/YDcmEPtWHlTn2syBAGFW+cwltjktH2HCa76au3TPQ
         hdgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795034617; x=1795639417;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2pYlTwk2wGwugpvwvlYaqR3MfohcECSz7ZDOgYENGZs=;
        b=MTEJFQ9w1Zvs3wE2cbUbOpaKjLV+7dJbO5G1+KM6WlrpQ6HWZ3Pre7Z0J2T21DjvB0
         VJs1erQkNSKUuQAMbPxl7yUo7hTSV8DIGV+nk6x368Wx8E+vvVZv60EQcy6+8Ek2VJbP
         ozy0D0cQgpy6yk1GKcKqNfVuqD34Hm3BR6pEJXwkaa1+U56D7SYDHOL4mKPyyqvDhoNf
         /4evl/XqQASEScpiscdwJLGmjU+t4UAETgjC2N0t+e2iTDKQUqzQ8uk3LszC5sAXS2s3
         qMz6i1U7DGZT2vlrKQOWwGu2k9SuK/Up/tNLGw+N7kH7LPcOgAPdRO248AepZDg4xCMV
         dvmA==
X-Gm-Message-State: APuU4Z+qchctRGyzQeiTtnmbtZ0+MEIjJZ8dkxO0ixBih8lOGSr88BCh
	t7bVcH4h/iWXJoOwky6tEO4nx2hnuM6blgE6xLWuMMjutx99zTXCJqD+2Rb2zdB28fYE4Df+bzf
	jVeg0B6WPWA==
X-Gm-Gg: AZFdTZdRqmrK/1p8h0JVO2ZRERqAJEqdD6LM9iqHGiG8T3QPhtW0+rW8Zt0yJ5LPICj
	+fyIM2z1Jg/O/oTsf3A28qVtHBiBJFIAmL5S8ZIA7ExQDMGm2GDtLI1YYOZblUbvezq+znPInlG
	PiLQDyTsVmLmazbBZzD0aebxs9lI81IFEG7TBBTxrtYX2k5Dt89SjICzq9cH0Yz8Kfco016Ohnp
	UJYHhukswx35I3zU0AEED+sjykOIzkewVIZulN8uHEk8XWm2WbQoV1KkMQuMCEsCWe7nQ7tgJSs
	HD3yfICZgcW5qXGiEQc7wFYYjNApXbuJ0uc273gxJ1bien7hhA3/MPkMnMdnLEA+F9ibxawGyEl
	o+BMs7eLTf18+OUUI4bIG5zuuQyx/vpJMlTkGLqcF89Zsu3vcRmBkuk/RLMJGfV5VO+6sMoe8gG
	02JIKP9FVX6a+BUtc6OkzSBuXOFWtb6l/Ff2BRBIHAFBBTgzyzg2xYr4IgXEYIM3wRI5HziSYdp
	88epOinX62Vcz4NPGCauWBMZO2OLQOkO4owfUJEuwu8iKD9Hj58YcE/CNmqGUttV9VQCB7eNDhw
	AXuh9LTLJR+zHlromns6ytfS//gthpNt26liiqjmkzq9+MRGaa8Ek92+uTroYf8FRUc4B+6ON5z
	QlOWbbcdFIoZNmPKc31owQ4j/oTE07poQ+zF+kLJpT1ArhCrpRGy4jzw8S373LJIswK18bd1VLw
	us9Q==
X-Received: by 2002:a17:90b:1846:b0:3ac:97bc:4c7b with SMTP id 98e67ed59e1d1-3b3d07a23d5mr3555145a91.14.1795034617294;
        Wed, 18 Nov 2026 12:43:37 -0800 (PST)
Received: from apex.localdomain (63-119-237-24.gci.net. [24.237.119.63])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3d56a3f93sm2631601a91.2.2026.11.18.12.43.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 12:43:35 -0800 (PST)
From: Jonathan Wolf <wolf@pi0.com>
To: ath12k@lists.infradead.org
Cc: baochen.qiang@oss.qualcomm.com,
	jjohnson@kernel.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH ath-current v2] wifi: ath12k: parse nested DBS/SBS capability TLVs
Date: Wed, 18 Nov 2026 11:43:01 -0900
Message-ID: <20261118204307.3154270-1-wolf@pi0.com>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_124338_372401_E1E5D7E0 
X-CRM114-Status: GOOD (  14.91  )
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

The DBS/SBS capabilities in WMI_SERVICE_READY_EXT2_EVENTID are carried
in a WMI_TAG_ARRAY_STRUCT containing nested TLVs. The array pointer
therefore points to an inner TLV header, not directly to struct
ath12k_wmi_dbs_or_sbs_cap_params.

Casting the array pointer to that structure reads hw_mode_id as
sbs_lower_band_end_freq. On WCN7850 firmware advertising hardware mode
5 and a 5900 MHz cutoff, the driver consequently records 5 MHz as the
cutoff. This produces invalid SBS ranges such as 4900-5 MHz and makes
a 5/6 GHz MLO pair appear to occupy the same hardware MAC, triggering
partner-link deactivation.

Iterate the nested capability TLVs with ath12k_wmi_tlv_iter() and reject
unexpected tags and payloads shorter than the capability structure.
Use the first record, matching the vendor host extractor, and leave
the cutoff at zero when the array is empty. Only store the cutoff
after the complete array has been validated. This leaves the existing
hardware-mode and link-selection policy unchanged.

Tested on a Steam Frame with WCN7850 hw2.0 using Valve's matching 7.2
kernel source. MLO advertisement and radio-mapping diagnostics were
enabled separately. The revised parser reported a 5900 MHz cutoff and
the driver mapped the associated 5260/6295 MHz links to separate MACs.
An unmodified upstream kernel was not boot-tested.

Tested-on: WCN7850 hw2.0 PCI WLAN.IOE_HMT.1.1-00018-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1

Fixes: 241d130f1419 ("wifi: ath12k: parse and save sbs_lower_band_end_freq from WMI_SERVICE_READY_EXT2_EVENTID event")
Signed-off-by: Jonathan Wolf <wolf@pi0.com>
---
Changes in v2:
- Separate Tested-on from the official trailers, as requested.
- Log DBS/SBS capability parsing failures before returning the error.
- Move cutoff storage and debug output into a dedicated DBS/SBS parsing
  helper, following the existing capability-helper pattern. Commit the
  first record only after the complete nested array validates.
- Remove the evidence link to the repository that is now private.

Local validation: 15 SERVICE_READY_EXT2 parser cases pass with ASan and
UBSan, including malformed later entries preserving the previous cutoff.
The failure cases also check that a parser warning is emitted. Strict
checkpatch on the code diff reports no errors, warnings, or checks.

v1: https://lore.kernel.org/ath12k/20261118012321.2861920-1-wolf@pi0.com/

 drivers/net/wireless/ath/ath12k/wmi.c | 47 +++++++++++++++++++++++----
 drivers/net/wireless/ath/ath12k/wmi.h |  1 +
 2 files changed, 41 insertions(+), 7 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/wmi.c b/drivers/net/wireless/ath/ath12k/wmi.c
index 75b259990..0cf6e1eab 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.c
+++ b/drivers/net/wireless/ath/ath12k/wmi.c
@@ -5781,11 +5781,47 @@ static int ath12k_wmi_update_hw_mode_list(struct ath12k_base *ab)
 	return 0;
 }
 
+static int ath12k_wmi_tlv_dbs_sbs_caps(struct ath12k_base *ab, u16 tag,
+				       u16 len, const void *ptr, void *data)
+{
+	const struct ath12k_wmi_dbs_or_sbs_cap_params **first = data;
+
+	if (tag != WMI_TAG_DBS_OR_SBS_CAP_EXT || len < sizeof(**first))
+		return -EPROTO;
+
+	if (!*first)
+		*first = ptr;
+
+	return 0;
+}
+
+static int ath12k_wmi_dbs_sbs_caps(struct ath12k_base *ab, u16 len,
+				   const void *ptr)
+{
+	const struct ath12k_wmi_dbs_or_sbs_cap_params *caps = NULL;
+	int ret;
+
+	ret = ath12k_wmi_tlv_iter(ab, ptr, len,
+				  ath12k_wmi_tlv_dbs_sbs_caps, &caps);
+	if (ret) {
+		ath12k_warn(ab, "failed to parse DBS/SBS capabilities WMI TLV: %d\n",
+			    ret);
+		return ret;
+	}
+
+	ab->wmi_ab.sbs_lower_band_end_freq =
+		caps ? le32_to_cpu(caps->sbs_lower_band_end_freq) : 0;
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
@@ -5840,12 +5876,9 @@ static int ath12k_wmi_svc_rdy_ext2_parse(struct ath12k_base *ab,
 		} else if (!parse->htt_msdu_idx_to_qtype_map_done) {
 			parse->htt_msdu_idx_to_qtype_map_done = true;
 		} else if (!parse->dbs_or_sbs_cap_ext_done) {
-			dbs_or_sbs_caps = ptr;
-			ab->wmi_ab.sbs_lower_band_end_freq =
-				__le32_to_cpu(dbs_or_sbs_caps->sbs_lower_band_end_freq);
-
-			ath12k_dbg(ab, ATH12K_DBG_WMI, "sbs_lower_band_end_freq %u\n",
-				   ab->wmi_ab.sbs_lower_band_end_freq);
+			ret = ath12k_wmi_dbs_sbs_caps(ab, len, ptr);
+			if (ret)
+				return ret;
 
 			ret = ath12k_wmi_update_hw_mode_list(ab);
 			if (ret) {
diff --git a/drivers/net/wireless/ath/ath12k/wmi.h b/drivers/net/wireless/ath/ath12k/wmi.h
index b508aa759..94bb6854b 100644
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


