Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A304606A32F
	for <ath12k@archiver.kernel.org>; Wed, 18 Nov 2026 01:23:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ZGBCXKOE;
	dkim=pass (2048-bit key) header.d=pi0.com header.i=@pi0.com header.a=rsa-sha256 header.s=google header.b=geykUqdv
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=hbf1hMVHk6D8YceI1OYtf6ohFuKyTuDRzyYUrPf22xo=; b=ZGBCXKOE4dI34spJdG/rwgw55R
	IcJZ2C/PGbRL4U9LzZqBl4Xxz4JiG1jZUyeqni9RW9MQH0J/xarwDbsqTILECOI8e0eSvJ9EQJfW7
	9DzgGg+LqzrMMBTb7yvUVJXWJwVMP94W5AHZhSkeJ1DCEXRTpwXQeg2Ci4jtNqQFySHjeCQH+Lkvu
	3QBs9r4wBEvxZ8M9RIMF0zAZ9FMdwUw/OWBfPzkN7z7QKURjae2+ySwtSvs6eDsafWV8Hmws5YeHz
	bASFbQ/6hZCC0d3tl+gzVegeZuUTf6ByqLsQhIb5f7N/hCvbPX1s88p+TUBHiGR9Zin4xlIRAj50c
	Yg21WWzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTUOY-00000007RLA-2TOE;
	Wed, 18 Nov 2026 01:23:30 +0000
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTUOW-00000007RKE-1dNi
	for ath12k@lists.infradead.org;
	Wed, 18 Nov 2026 01:23:29 +0000
Received: by mail-pg1-x533.google.com with SMTP id 41be03b00d2f7-cdb2dfcca94so194823a12.1
        for <ath12k@lists.infradead.org>; Tue, 17 Nov 2026 17:23:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pi0.com; s=google; t=1794965007; x=1795569807; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hbf1hMVHk6D8YceI1OYtf6ohFuKyTuDRzyYUrPf22xo=;
        b=geykUqdvV8H3GsL5JoTAzMYOfUw0NoWFnVSXq71lcyc+1gO3J1YRbWvONjC5ww+mzw
         deK1We6Ew7LkonMRgsITYczgjALJQxEHzwAMBbMG4eoKlBStxFdsSQa34NH8CbKE7E98
         wCdKCYjzW9GZXHKCmcu0HbCZY5so1pUjsq6jmBaSqd7l0uTdGHyphJoXl7s9b8vOTC9V
         Td+bSNs0tif3vMJB++k33Cu5X7hRc8WjjX/oNrEMIL/hyeToaCxmUou9iDFLLqHG0y01
         AVv877IncthNo8DuwZnjlUXKs2oOrx4PHc39v+cGJupTpn4Z1iTQu+fHEmfT7cxgc7kJ
         67eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794965007; x=1795569807;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hbf1hMVHk6D8YceI1OYtf6ohFuKyTuDRzyYUrPf22xo=;
        b=mWzeJCf2i5+yAC6trbQhkIyAQKRtcxz6WUilgB0I7sumvRx0WTui462pXONTqORFdb
         lSDFcZWCH6scUP8HYgfJ+KyKZHscR7E5Oa8qW1ZW1gZqSoTfl61ttzFz4nNOCTKzMU9/
         erbsAbHBWxXvtoTQGnji7oZs/pUEKj7xk3Sb2nIBWZFCAuyhvnyVXjqSprWZ2sA80GHl
         qEBedrxXZWQWb6XH0oI9p/FpUqyKDrFw9f2WOyhTfZuBM7LaTn8RrWLP14shi4/s7Ek4
         srhGg8RGu8b9+oiwwP74KZT50TVpBUeQJ0Fkdk2B5PsZ+6dbUCPxBt7g70l2qMhO0HZ+
         cugw==
X-Gm-Message-State: APuU4Z+zpaQMEhCWN/tn5K3QC92twQilxgRmj2k/Tx/FIiNTNfshQer5
	h9RUH3H8jerW9SzXGZjbcNmW86k7TT2l8OVH8jT7hX4dWJ0kH7SAU+Vuj8Vnt3Pf0u1i6okYgKR
	0tdcdcBj8GQ==
X-Gm-Gg: AZFdTZdw99nAQ+dpy3zs/VCINgekw5PeLwrJGrIdTaOOq8CDcic02pOlSn7TbOfzxQY
	bA7qaUBBRciz1qNp7nDvxfDvqLX9GcHkvrnmLu8jwGplF5pZwjnUU9U6j+J8Nl8okRLmlT4anPI
	RehG+Z4ALXBAa3oyQg1HN/pxX5yywr7I64YHxkc2TlJ4VB0hNYWAONBbh8XN4a2Is/l6GVdjeXX
	xqmxpRdIkOshpt4wparuqmyN0sAmqBZC5pyikfBPqVSLzsVyniNn4qylHwd1AreeW4FSQmRIYcd
	FakdZcXpmBaz8SgSrHt8JRwCU5hPlpeY8LHNIQt+VLCcL4DNcByhrczr8gNoBIE36JCApSflbJg
	i2XfEabGoXG/1GthWIAor2ycOaxZRSpQt7pCFcYiw2Mmv7mU6wwa7Zm7BbNpi//AYPPi6ympNmS
	aQFPntmYs8VDjw6CLiC8WGuQzLHPLVCwi/2woGQCXRFvWqBD/MezXagqJRXk2cTsh9z9KULlriH
	X3y37Ht5Vhs6OWdrX7FhcROaLKJA1z9mseJRqqTrvuXmnnnmh2/t3ZQrU+MzLE+5bdKhdHIosN+
	7dOZoAAuWlkB/kgcCoFjqq9GO2bLnuQXic9vopdrmy+t+S5XpWWqYQxD9itHTcZAGtlszAi7wNG
	H+w+EImVoFsJk70MVHYo//eCQW9W9SHGuNNJ5LO3OF6p4boPFz9BdeY2I
X-Received: by 2002:a17:90b:4c8a:b0:3b3:c998:6d6d with SMTP id 98e67ed59e1d1-3b3d07d454dmr1081904a91.47.1794965006850;
        Tue, 17 Nov 2026 17:23:26 -0800 (PST)
Received: from apex.localdomain (63-119-237-24.gci.net. [24.237.119.63])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3d187aa1esm1439308a91.5.2026.11.17.17.23.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 17:23:26 -0800 (PST)
From: Jonathan Wolf <wolf@pi0.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
	jjohnson@kernel.org,
	baochen.qiang@oss.qualcomm.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH ath-current] wifi: ath12k: parse nested DBS/SBS capability TLVs
Date: Tue, 17 Nov 2026 16:23:21 -0900
Message-ID: <20261118012321.2861920-1-wolf@pi0.com>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_172328_448063_34D8A29D 
X-CRM114-Status: GOOD (  14.54  )
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
X-Spam-Status: No, score=-23.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
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

Tested this parser on a Steam Frame with WCN7850 hw2.0, applying the
patch to Valve's matching 7.2 kernel source. MLO advertisement and
radio-mapping diagnostics were enabled separately. The cutoff changed
from 5 to 5900 MHz, the 5200/6135 MHz links mapped to separate MACs,
and AP-side data counters increased on both links during traffic.
No driver recovery or association loss was observed during the test.
An unmodified upstream kernel was not boot-tested.

Fixes: 241d130f1419 ("wifi: ath12k: parse and save sbs_lower_band_end_freq from WMI_SERVICE_READY_EXT2_EVENTID event")
Link: https://github.com/pi0code/frame-mlo/blob/main/results/final-parser-live-test.txt
Tested-on: WCN7850 hw2.0 PCI WLAN.IOE_HMT.1.1-00018-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1
Signed-off-by: Jonathan Wolf <wolf@pi0.com>
---
 drivers/net/wireless/ath/ath12k/wmi.c | 24 +++++++++++++++++++++---
 drivers/net/wireless/ath/ath12k/wmi.h |  1 +
 2 files changed, 22 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/wmi.c b/drivers/net/wireless/ath/ath12k/wmi.c
index 75b259990..f43c9a359 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.c
+++ b/drivers/net/wireless/ath/ath12k/wmi.c
@@ -5781,11 +5781,25 @@ static int ath12k_wmi_update_hw_mode_list(struct ath12k_base *ab)
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
 static int ath12k_wmi_svc_rdy_ext2_parse(struct ath12k_base *ab,
 					 u16 tag, u16 len,
 					 const void *ptr, void *data)
 {
-	const struct ath12k_wmi_dbs_or_sbs_cap_params *dbs_or_sbs_caps;
+	const struct ath12k_wmi_dbs_or_sbs_cap_params *caps = NULL;
 	struct ath12k_wmi_pdev *wmi_handle = &ab->wmi_ab.wmi[0];
 	struct ath12k_wmi_svc_rdy_ext2_parse *parse = data;
 	int ret;
@@ -5840,9 +5854,13 @@ static int ath12k_wmi_svc_rdy_ext2_parse(struct ath12k_base *ab,
 		} else if (!parse->htt_msdu_idx_to_qtype_map_done) {
 			parse->htt_msdu_idx_to_qtype_map_done = true;
 		} else if (!parse->dbs_or_sbs_cap_ext_done) {
-			dbs_or_sbs_caps = ptr;
+			ret = ath12k_wmi_tlv_iter(ab, ptr, len,
+						  ath12k_wmi_tlv_dbs_sbs_caps, &caps);
+			if (ret)
+				return ret;
+
 			ab->wmi_ab.sbs_lower_band_end_freq =
-				__le32_to_cpu(dbs_or_sbs_caps->sbs_lower_band_end_freq);
+				caps ? le32_to_cpu(caps->sbs_lower_band_end_freq) : 0;
 
 			ath12k_dbg(ab, ATH12K_DBG_WMI, "sbs_lower_band_end_freq %u\n",
 				   ab->wmi_ab.sbs_lower_band_end_freq);
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
-- 
2.56.0


