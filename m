Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A2B4606A31A
	for <ath12k@archiver.kernel.org>; Fri, 23 Oct 2026 07:27:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=gtNC5Nk+;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bI6SmZwL;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Xy1gLqYB
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=alOZNhc/hBycopSj6aablVmFXgtwQwPhX17D8dTQR5Y=; b=gtNC5Nk+86ym+I
	KJ0YWthIOMv9As3Pe4xQzErLt6HABntLdt9kPx4q8wvrhyzklDW/f/An7RTMsY8/ctQPSEUTEKox5
	wuiGUw3WFzbPUCbM/P+oD0q7YiMFZuVPNXxrqVzt2+WPz0ucNwcV5nCYwg5G66IQCnwKBF5mKyOd9
	2ovTbVaafK2iHpFNUxMcEsWJgCnRqQD1hm+qzQW7Lg5A6r+RDtNyO5H1202vXmLx7XdC+iDZbGal3
	TWL3JCgc4nEOyiCrQ+zSiM/97h7vhinQC/UqHMg39l8Lv9bA64UCRzvc1Fv7CkNY1Blrz8KGlVEd9
	lTy4zvrbGPe059qyCsTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK9gL-0000000FkVp-2dFU;
	Fri, 23 Oct 2026 07:27:17 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK9gI-0000000FkVQ-2MgC
	for ath12k@lists.infradead.org;
	Fri, 23 Oct 2026 07:27:15 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69N1Euum772900
	for <ath12k@lists.infradead.org>; Fri, 23 Oct 2026 07:02:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	alOZNhc/hBycopSj6aablVmFXgtwQwPhX17D8dTQR5Y=; b=bI6SmZwLCFk7Z0ok
	Sn9qNsE4URzMOnntz1F/3GzPqys+FvgZKSAGJwNa1ILVlXQfEhArYnOwlOdzpLv2
	XKtvkoQD05IXAzIUrHEWk0sSxR5iiwDC13s0t5KrR2lmZTXltVJMrlMXv1j10H8x
	N+BhvbiaBgvyxFIG3o/G3v1DcUUlhfwWVfCAxN5z4XGu6/LLMCV6zUmfw66Ia4dl
	O6Kdf8VoanQdczSMZ2fCp09LmJHa/Q2PTQk5aIsdxHFzYzCIiFEnU9BQR2G+A/C1
	HD+rGp9Y/KWl/NzbihKqmyAofU7E4dcthGXOCvw2MTvyqbg025WAVbfJQ5TuAkwu
	A4wg2w==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfqmttbtq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 23 Oct 2026 07:02:19 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cd60a365440so388264a12.2
        for <ath12k@lists.infradead.org>; Fri, 23 Oct 2026 00:02:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792738939; x=1793343739; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=alOZNhc/hBycopSj6aablVmFXgtwQwPhX17D8dTQR5Y=;
        b=Xy1gLqYBy2a9rtCBn7ub2zkl5PVHN74EB36tWClbNn482NvaHewN/lwByEUKee64Jg
         csHlwxjyDy+zEe6+3NQ+XbAxjodulaLBYsKfGaDBwnWZxxI9n9Hdj4/cwIQJeujRVMed
         ukBO64yd98UgZXq2CCS4kCIBXRTbr2ur4UA0dLJ9a9/Yj1P8c4I7X62eunubNg+IYs1B
         OddN/IOBSleSIWxv7Q4Ec0fJZtD+c3Py8luzFLVA3lq5Wqan5RgcHD1Yuzq/EIxPpy5A
         NYlZ+ZZP0/VqBB8pUIRozNo7XuYrvpom6WLzYxHuohOc9ktZPw1Jori3vtMDaOBndyua
         ez/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792738939; x=1793343739;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=alOZNhc/hBycopSj6aablVmFXgtwQwPhX17D8dTQR5Y=;
        b=KYUpL6xVLvPHle8ANOktCEhgjXLAp87R7VmHlulK5F1+zXPVsQfv3Loo2ye1v6pJWi
         MlrUZSbc32XoR18JLTJqGAz0ODva8/0D1hgMXbEcdZ49KYSkw/z6jO/q3UvPXVbwLHLX
         5gBrTnob9oIR1uhVlHuxGYcfs8lk7hfpBZbqskZKRJfLMjEb3P5gF88GudlQ9R+1G/WP
         lrAuZpsPGkzBJjVG4QZJhhL/yclauvS4i4pwuzU+oYs3tPnUbekQ1A26t/izZ78yPC6x
         T5cYtAj9qP15RCCROAdbyH+TLbiizazsWSd+TpH1BX+/f5wz9hGP84tlvnRhIN9fRQ+j
         y88g==
X-Forwarded-Encrypted: i=1; AKwUvBwx8Dk3IBYUdE9X/lnk/bu91yUYRNtxM4o3m77YHhRCx13JqVTRUWDqfMyEwNmD6SuFkiV+k5I=@lists.infradead.org
X-Gm-Message-State: AFq9FYKVSNp51UXC54ZHj5SuTsKDtyp5FywGaSUqvWaE5RZY0InwbXIT
	gai1RbZzCzoBoS9olxPyAbabPu+j0v2QSE+9eq242v5wjK+rsOFhPToCB6UDWBWYre1ABbyJVC1
	yOwXndaYV3V4V4hr0iTMdy3pwt/anBUWCygqs1THsCpr5pELb2lyXhWzvvNT1bzns
X-Gm-Gg: AYBFou2DrTkkmTTIP2MBwgLhbZMBymnxKOeYC5O6sX9foSqkiQXYGeBVu1p1h13MoH4
	IpBclXpzHsft+CCt4jT5PGtiHOnVWce5xuZCWfj4sZr4KlKAr0XfobkrzOVN6OPJxWCwwpq8wt+
	YmVLaIaCabilana4qG8hirGgIndfdwwnxU/wOmqzoi0btu4ubKVf36w2p1OWnJviAIYzps8gjmm
	QrKMydbUV9iChagMVcak6oFX+r+mlJmaDc/O4+yhzN6ntP5GQ38w+Qgdm4Wg1KdXCXITtudquhB
	568mPFNWa/h17zANYpgKPyrnRmC8v6CSw18GcVwxwX/c5Y2tyttC5Wf2Rrpfwfg6wocZA9u+M65
	YnMXknX+Ea2attTcwHK9f5PzkBPpvUZJQSEXQZu7YdqB89TiaWoTS9ZX4rvsOYhfi1YmnfqaQ6f
	pG3BcJh5bcCIYrTbTmq2emdw==
X-Received: by 2002:a05:6a21:7e03:b0:3e2:57b7:4d7e with SMTP id adf61e73a8af0-3e359a4a06fmr983842637.10.1792738938939;
        Fri, 23 Oct 2026 00:02:18 -0700 (PDT)
X-Received: by 2002:a05:6a21:7e03:b0:3e2:57b7:4d7e with SMTP id adf61e73a8af0-3e359a4a06fmr983816637.10.1792738938254;
        Fri, 23 Oct 2026 00:02:18 -0700 (PDT)
Received: from hu-aarasahu-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd8ba8a6dcdsm399751a12.18.2026.10.23.00.02.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 00:02:17 -0700 (PDT)
From: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 12:31:18 +0530
Subject: [PATCH ath-next v3 15/17] wifi: ath12k: Derive QMI service
 instance ID per protection domain
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261023-mpp-bringup-v3-15-19f3fcbf7b5f@oss.qualcomm.com>
References: <20261023-mpp-bringup-v3-0-19f3fcbf7b5f@oss.qualcomm.com>
In-Reply-To: <20261023-mpp-bringup-v3-0-19f3fcbf7b5f@oss.qualcomm.com>
To: Johannes Berg <johannes@sipsolutions.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ath12k@lists.infradead.org,
        Sowmiya Sree Elavalagan <quic_ssreeela@quicinc.com>,
        Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Authority-Analysis: v=2.4 cv=Gt3XaU1C c=1 sm=1 tr=0 ts=6adb067b cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=1lU9L7Y0PnsvXye6yGIA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: UsJ19gUA6l2RNHn4A84DL3FY5IeIIBGb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDAyNyBTYWx0ZWRfXyI3FCn6Ufubc
 p5k8Zae+zQE/fDh432Da623TuJG9Xi6OhXH5FfXM07xxtxtCMzs782lRQf4mGQ7FWiK+iNRUTvH
 /A7XDz+AIZG85Pq/FDtn+B4TK5BrKsaiXMCiHC8BtMikTb2Q2bXx1UltX5DgdObpb3Wil9DNvvI
 O9ZWc+EhCxxLkdl24qMbs/YUG51mIcpkKmrHzkc7GG7et80ZyjcLDu5WzswdQ8wYNZ1EFohJ81m
 4tAixteuKRdVxyIKaaaAlMr5N+CK/7+90w2DVc1FkRww6lm+ByeoMV2CJDfgmDppvnZGW+nRC9O
 07PQl9VJmY1kXihdPuYG/5wgev8rn0/C0FUjlh8wbnidE+gjoo9VFpdnX4VRLMKWvLY3s2bEjq9
 FcICCJXTUbhyH4EGbI8kedGuFiXEpfHEbKjmcOdskHgElqDQtMaWU/JSNIA+5p79s4xpLgbxhgq
 FaZcwrjVAv0e+wYcWew==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDAyNyBTYWx0ZWRfX3Q1qRxr2CPwj
 98ql0VycJ2jLuG69MI+H5W47d1+5XYYdvw/udy2h7o6P0rSp1d2WFJ9nXy7gVZnn9OMCHYNYEQM
 7TL8CqQ3hjvXAUohxNttlP3HZzh8XyU=
X-Proofpoint-ORIG-GUID: UsJ19gUA6l2RNHn4A84DL3FY5IeIIBGb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 suspectscore=0 malwarescore=0 adultscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 phishscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610230027
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261023_002714_624623_14887E8B 
X-CRM114-Status: GOOD (  12.86  )
X-Spam-Score: -2.8 (--)
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
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Sowmiya Sree Elavalagan <quic_ssreeela@quicinc.com>

IPQ5332 platform variants are supporting multiple Protection Domains
(PDs), each PD exposes its own instance of QMI services. The current
implementation uses a fixed qmi_service_ins_id from hw_params, which
results in multiple PDs sharing the same service instance ID.

Update ath12k_ahb_init_qmi_ce_config() to derive the QMI service
instance ID based on the user PD identifier. Offset the base
qmi_service_ins_id with (userpd_id - 1) to ensure each PD gets a
unique service instance.

This avoids QMI service instance conflicts and enables correct
operation on multi-PD targets.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1
Tested-on: IPQ5332 hw1.0 AHB WLAN.WBE.1.6-01322-QCAHKSWPL_SILICONZ-1
Tested-on: QCN6432 hw1.0 AHB WLAN.WBE.1.6-01322-QCAHKSWPL_SILICONZ-1

Signed-off-by: Sowmiya Sree Elavalagan <quic_ssreeela@quicinc.com>
Signed-off-by: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/ahb.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/ahb.c b/drivers/net/wireless/ath/ath12k/ahb.c
index b9ec14e86def..cecafc12e8a8 100644
--- a/drivers/net/wireless/ath/ath12k/ahb.c
+++ b/drivers/net/wireless/ath/ath12k/ahb.c
@@ -567,12 +567,14 @@ static void ath12k_ahb_power_down(struct ath12k_base *ab, bool is_suspend)
 static void ath12k_ahb_init_qmi_ce_config(struct ath12k_base *ab)
 {
 	struct ath12k_qmi_ce_cfg *cfg = &ab->qmi.ce_cfg;
+	struct ath12k_ahb *ab_ahb = ath12k_ab_to_ahb(ab);
 
 	cfg->tgt_ce_len = ab->hw_params->target_ce_count;
 	cfg->tgt_ce = ab->hw_params->target_ce_config;
 	cfg->svc_to_ce_map_len = ab->hw_params->svc_to_ce_map_len;
 	cfg->svc_to_ce_map = ab->hw_params->svc_to_ce_map;
-	ab->qmi.service_ins_id = ab->hw_params->qmi_service_ins_id;
+	ab->qmi.service_ins_id = ab->hw_params->qmi_service_ins_id +
+				 (ab_ahb->userpd_id - ATH12K_AHB_USERPD_ID_0);
 }
 
 static void ath12k_ahb_ce_workqueue(struct work_struct *work)

-- 
2.34.1


