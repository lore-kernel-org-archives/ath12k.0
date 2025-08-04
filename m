Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4053BC87FCA
	for <ath12k@archiver.kernel.org>; Mon,  4 Aug 2025 03:03:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kugaIG05z6TB8lU/3AG4HIpKbvmdeKqgwRzdGMse6is=; b=3WdaSv4eY2Sx+YcYhq+L+QQzq3
	Rc5TRwZ4f8HpgBPZ+VACefGNgBKD44H0DS5gbKV80qiAn8Hjjem95zOlPyh3BQ0WN+47y4FQbqPg7
	DfT15IQPnL5tkI8ZVePq6dpGuQa4u3b6OufVhAUlj4McpeOOY9sCeANJX1Wg9ROxn3WG69H+uQmru
	H4KgmZCXz4DJAoIlpLV9fmBBGcaXCTRiv2608Rv4DDJFhX1OEEUvtMnOrKJPpqOe24oRLK4WeeZsT
	sL/WO+zdbx4LMyRDbDXE2fxUBtaCRVZv91bgSCKEzLdMuFedo7Ra/IUnoxz5zZ+WjrZM/Xe1IQ4+Z
	w+11i1vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uilU8-00000009WnH-05Qd;
	Mon, 04 Aug 2025 03:03:36 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uilU6-00000009WmM-1IIF
	for ath12k@lists.infradead.org;
	Mon, 04 Aug 2025 03:03:35 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 573NTHGk021948
	for <ath12k@lists.infradead.org>; Mon, 4 Aug 2025 03:03:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kugaIG05z6TB8lU/3AG4HIpKbvmdeKqgwRzdGMse6is=; b=GxaFGpnFpjSf+FAN
	ymIONS7/Jzrr90nV1sY4hOOnufocbaJ8B1oSxmaltbNtjlwAxBEWtsU4VWVI1T20
	Eq0cF79novVLJ5G1qDojD7CseKI7Ow7+Pd6EoAWMfcGKwKFAKCKSwp0YNQGJh+hZ
	8qVQLpC721k56v1+ISRVoBSljwWGVhkmh0F5EdzCJUpOyfi31kLISHgM4kf04r4A
	KZJHLcQMg+1Lx8kzjz1+dgKh9MZzMnp1ho5yig6PSJwWZ90WBiD8ive7ysqP1hpX
	KCnrJLmvna610rSoNCgrCoEEkm7j7mQXKNqmu3dOPI/3Lo9/+HZ2hcYPQbAwe4yA
	4ScncQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48a2ke1c6a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 04 Aug 2025 03:03:33 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-31eec1709e7so4277515a91.0
        for <ath12k@lists.infradead.org>; Sun, 03 Aug 2025 20:03:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754276612; x=1754881412;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kugaIG05z6TB8lU/3AG4HIpKbvmdeKqgwRzdGMse6is=;
        b=L/Z6EBcN9l/JKylAY8dsAVyQbA3WEszy88P1EWI+HSeUPYVOlGMhuTqCsE0WMtnF5u
         Gr9EMerdXmlE+YHMbYFp3+XNknQb2vOkb8/WOnIaWkv68aHAHX+nfiPTdXGqyPkWcpzG
         EIT5tWouy1G54OgHJFruvKZdHcTW0QZCiUGSJkVhxHEQ9nu8oE1nmk88zfXMKp0ftxFV
         qmoIEKNrzEpdhm5kC9NcmUj62KB5kXEYJ41EMVdSjCmkJYBkXCm8yFdY3ZArV3DklvVw
         0K5nq0esYybhxhWMYBOW+71Ymitql36G6t+vT3sZ0X+AfeMPWRRoRnNIdFcuTF/X8W3V
         7qWQ==
X-Forwarded-Encrypted: i=1; AJvYcCXwYNzsTgzP71Z+t+DwV1ySYp92hiC/duQnyFw2yUpu68GSu5RaeW1YWMIN7IfrrMuLDQchy8E=@lists.infradead.org
X-Gm-Message-State: AOJu0YyAD6rgIKHLBGRJ2RF1R7Iz2A5TukyZJUoZHvegLL8aTHdWLRz3
	QL2Zy9sob9W9uGrm+KucEO7a6WFDNnbvIeC7MhAvtg+ObCmCZ/S5ksew/VTz+h1Jes7DJai1deh
	1vSVAiDu0Nd1PJadLoOVdRqqrmgUXnTLBYIj4g0R+WutWwD5QeOl960vfQSsK9qD/p1zw9cVx
X-Gm-Gg: ASbGnctQstvzi0RzSYZiC+gsRaAfc4nqExClzo4G84iqvXX3FjaMgxqbD5gblHT4EoR
	5+b7DgN6X5tUU01ytvT5q9KYM+UxFJA/VhRBVlFbmrAwnAURQQDtyHpPvuQBMo8NQ9ceIFa2Va5
	E5OnYxfbcNDh+x+4iGfUPLVS3LYgiZ5MhdlvvYMNNN+56hFjhrSZ9CCQtndXfKcWlWhI08n9eQs
	5CrSnLmuReGevXlOVTBoMIPzktZolRdvSXC1DBt3VUKVgPLXETONTyGzrW+H72AsvRGNIMQ6LBp
	PPc8qYR5XxLAqy18j6LIRO2o49WnY1TCOlcGspWQ1+SCLC5AfPh0Ruu9oLiCZSGbt20eobVX1FT
	kPq4MITCJm6PjEgx1Kw==
X-Received: by 2002:a05:6a20:3ca3:b0:240:dc9:71cf with SMTP id adf61e73a8af0-2400dc976eemr2467493637.38.1754276612429;
        Sun, 03 Aug 2025 20:03:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHQ8hpq8FcFPIUvqKGjKzFf0aD9aYMfmslygFO5EjJQ8zoEQ0LW0hIkkoaNDD9j549pSh6i1w==
X-Received: by 2002:a05:6a20:3ca3:b0:240:dc9:71cf with SMTP id adf61e73a8af0-2400dc976eemr2467453637.38.1754276611989;
        Sun, 03 Aug 2025 20:03:31 -0700 (PDT)
Received: from [127.0.1.1] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3207ebc0e79sm10489000a91.10.2025.08.03.20.03.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Aug 2025 20:03:31 -0700 (PDT)
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Date: Mon, 04 Aug 2025 11:03:11 +0800
Subject: [PATCH ath-next 2/2] wifi: ath12k: fix overflow warning on
 num_pwr_levels
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250804-ath12k-fix-smatch-warning-on-6g-vlp-v1-2-56f1e54152ab@oss.qualcomm.com>
References: <20250804-ath12k-fix-smatch-warning-on-6g-vlp-v1-0-56f1e54152ab@oss.qualcomm.com>
In-Reply-To: <20250804-ath12k-fix-smatch-warning-on-6g-vlp-v1-0-56f1e54152ab@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>,
        Baochen Qiang <quic_bqiang@quicinc.com>,
        Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
Cc: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
        kernel test robot <lkp@intel.com>,
        Dan Carpenter <dan.carpenter@linaro.org>
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: 8mnvPZ23HnfA3WwBLOjQ7nqhXsx_JfjI
X-Authority-Analysis: v=2.4 cv=TMNFS0la c=1 sm=1 tr=0 ts=68902305 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=QyXUC8HyAAAA:8
 a=COk6AnOGAAAA:8 a=KKAkSRfTAAAA:8 a=eeRMwnN673tcwiIEPYQA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA0MDAxNCBTYWx0ZWRfX7BQ3lWYOSF/M
 fcG7tNGJ/cN+7OcAIP8RZQhPy6d3BNnvENgAya0sZdSMgAckAmNe5bW51WYnHchFInB2CYkbm3q
 Ndy0gP7HsX7X+T4Pd+CuwEOuCVxiNxlv//FWE7yGpn3zfs5nArUqFq3xg/B76duIhNr4Gi1APFO
 veMZpLd/VcYC3l3n7YPuYgnE+XseP5Z2Mq2ovUth7Mw++J98MVuTHlkE2zqinQf6FUCXuei3MQn
 nVTjsDKfwFn4EVbfY7F5hL++m+qkx1TPpqT8K6qkfj648nyhIiD6lx3ozmkGxNb1inf+CxEfxR5
 jVTOlNCue5mjivmJVfhV5jQvA/Q13n6lAMyPAe2cmP7wSdSTsLS+65Pr28QuLr5/1e2vKyxkTDU
 u5Rsosd1NOcgXZzojZrRtxWEC6RITJ56ikqJhwwlA4E1Wd9+LXL+ieeqzGngF5op1SDBJxi7
X-Proofpoint-GUID: 8mnvPZ23HnfA3WwBLOjQ7nqhXsx_JfjI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-04_01,2025-08-01_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 phishscore=0 malwarescore=0 clxscore=1015
 impostorscore=0 lowpriorityscore=0 adultscore=0 mlxlogscore=896 bulkscore=0
 priorityscore=1501 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2508040014
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250803_200334_363861_C3E6B629 
X-CRM114-Status: GOOD (  16.01  )
X-BeenThere: ath12k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath12k.lists.infradead.org>
List-Unsubscribe: <https://lists.infradead.org/mailman/options/ath12k>,
 <mailto:ath12k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath12k/>
List-Post: <mailto:ath12k@lists.infradead.org>
List-Help: <mailto:ath12k-request@lists.infradead.org?subject=help>
List-Subscribe: <https://lists.infradead.org/mailman/listinfo/ath12k>,
 <mailto:ath12k-request@lists.infradead.org?subject=subscribe>
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org

From: Baochen Qiang <quic_bqiang@quicinc.com>

In ath12k_mac_parse_tx_pwr_env(), for the non-PSD case num_pwr_levels is
limited by ATH12K_NUM_PWR_LEVELS which is 16:

	if (tpc_info->num_pwr_levels > ATH12K_NUM_PWR_LEVELS)
		tpc_info->num_pwr_levels = ATH12K_NUM_PWR_LEVELS;

Then it is used to iterate entries in local_non_psd->power[] and
reg_non_psd->power[]:

	for (i = 0; i < tpc_info->num_pwr_levels; i++) {
		tpc_info->tpe[i] = min(local_non_psd->power[i],
				       reg_non_psd->power[i]) / 2;

Since the two array are of size 5, Smatch warns:

drivers/net/wireless/ath/ath12k/mac.c:9812
ath12k_mac_parse_tx_pwr_env() error: buffer overflow 'local_non_psd->power' 5 <= 15
drivers/net/wireless/ath/ath12k/mac.c:9812
ath12k_mac_parse_tx_pwr_env() error: buffer overflow 'reg_non_psd->power' 5 <= 15

This is a false positive as there is already implicit limitation:

	tpc_info->num_pwr_levels = max(local_non_psd->count,
				       reg_non_psd->count);

meaning it won't exceed 5.

However, to make robot happy, add explicit limit there.

Also add the same to the PSD case, although no warning due to
ATH12K_NUM_PWR_LEVELS equals IEEE80211_TPE_PSD_ENTRIES_320MHZ.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c5-00284-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1

Fixes: cccbb9d0dd6a ("wifi: ath12k: add parse of transmit power envelope element")
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Closes: https://lore.kernel.org/r/202505180703.Kr9OfQRP-lkp@intel.com/
Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/mac.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 8295480e8b1eeaa3e69cca823e6745733ade50e0..57c81ba988ad3c7c3037286c6c093cef4c4f8116 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -11435,8 +11435,10 @@ static void ath12k_mac_parse_tx_pwr_env(struct ath12k *ar,
 
 		tpc_info->num_pwr_levels = max(local_psd->count,
 					       reg_psd->count);
-		if (tpc_info->num_pwr_levels > ATH12K_NUM_PWR_LEVELS)
-			tpc_info->num_pwr_levels = ATH12K_NUM_PWR_LEVELS;
+		tpc_info->num_pwr_levels =
+				min3(tpc_info->num_pwr_levels,
+				     IEEE80211_TPE_PSD_ENTRIES_320MHZ,
+				     ATH12K_NUM_PWR_LEVELS);
 
 		for (i = 0; i < tpc_info->num_pwr_levels; i++) {
 			tpc_info->tpe[i] = min(local_psd->power[i],
@@ -11451,8 +11453,10 @@ static void ath12k_mac_parse_tx_pwr_env(struct ath12k *ar,
 
 		tpc_info->num_pwr_levels = max(local_non_psd->count,
 					       reg_non_psd->count);
-		if (tpc_info->num_pwr_levels > ATH12K_NUM_PWR_LEVELS)
-			tpc_info->num_pwr_levels = ATH12K_NUM_PWR_LEVELS;
+		tpc_info->num_pwr_levels =
+				min3(tpc_info->num_pwr_levels,
+				     IEEE80211_TPE_EIRP_ENTRIES_320MHZ,
+				     ATH12K_NUM_PWR_LEVELS);
 
 		for (i = 0; i < tpc_info->num_pwr_levels; i++) {
 			tpc_info->tpe[i] = min(local_non_psd->power[i],

-- 
2.25.1


