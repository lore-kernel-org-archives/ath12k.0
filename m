Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5CAACC6B1A
	for <ath12k@archiver.kernel.org>; Wed, 14 Oct 2026 13:03:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f6GuRcuGOLcIK8U1i/42FXzU8VT6SBWZltoaozE4kyo=; b=ZOdMvX2ShLsg55RaTyhZ0S45b8
	o5+NpFLFq8CoOVWdqMJfhwDfktpDts/3xWsUrnFWxl5+WyKO/24pRNaQZTq907bHngAFLl2+l3Z2z
	ne4g1A6S2oioYe5cwmvj7TSEtYFkPEF8uc5RqFjF9j8TNIT9iFBZS8cGXWbmKs/YVsZ6uhCXcEilj
	vtsL+n8h5LMk/4NFnBJcgveLk0icld9zAQHN/edqtmCQHSLqUYhWcouMBFmt3yKBWjIci0cJSrXl9
	g08qQ2UZUzTfBIGfGmZn+8mNUPbDFUAvfT2Ue7Qk546AnbOavmd5eqNNNgp7FF27eTyy0zj74SMf4
	bW2wRZnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGydi-0000000FWUX-170k;
	Wed, 14 Oct 2026 13:03:26 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGydX-0000000FWQB-2sOA
	for ath12k@bombadil.infradead.org;
	Wed, 14 Oct 2026 13:03:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=f6GuRcuGOLcIK8U1i/42FXzU8VT6SBWZltoaozE4kyo=; b=lx+WQJeWNem1PzPVDdjmu7xknm
	8zPiSGdb4HYU8IlBTnQbHFD+GJUFDmrMcK/abSKHcT0XuCmY/KHmLi3RuVWqxlX95sJsuSVfD9HBN
	xAbHK0fk0hPt78lAjNaWkHS0frGLwqouPTWFv3kXq2piwT/eEvYO66e7uzDKQQ2GVIqea3/Sw1Lhi
	wP5H18cGY6me5bpJOd7lNwmvTBISY+NlXX5KFLa3qVfx0Aa5NIuTiLVFHcJL1aYbsCbQeK04/Fx5N
	bipA7f+TkbWaxHmn1LKT6stOiGagl4QeUUVfzuBHjeIIQT9OsrNpfnVk3XzGeYNdz5Tad2xJyrLkl
	tk6OO2jQ==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xGydU-0000000Gmoh-2j6O
	for ath12k@lists.infradead.org;
	Wed, 14 Oct 2026 13:03:14 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69E8i3lA3000877
	for <ath12k@lists.infradead.org>; Wed, 14 Oct 2026 13:03:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	f6GuRcuGOLcIK8U1i/42FXzU8VT6SBWZltoaozE4kyo=; b=NqIEWlTpj31oiWxd
	VyDcdIJj8hN4vD5SJQx92tB2Jj0meGvtc5ahP2salRE/mmW3MQAtDCcaFPJTdwJr
	vIvMOXNk3Kz742RCCT+YsYQlm/msQ4yqYu3RtVaa9oIOlEnzNzSZcuXAbIwkSGjm
	c/ZG06+0CuS5FFLcSn/Gl20RMvMhdtrZq0nNhM3fLab+kr7p1KTTcHssRanQ91Mb
	JdQFe1QiICXanOb2Gn4u0na/EKz7jMblM30ADgHkEYeiOy5i+GR+PUuCbCNvz4Ce
	arYcjFUwHepDgIcFfk5j/lG8ekSRfJtixneLEHFz/HzzoDsd1RgS4VO/Sm8bwPbs
	qIve4A==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9sbev1vd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 14 Oct 2026 13:03:10 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5e5e644a7acso4197444e0c.1
        for <ath12k@lists.infradead.org>; Wed, 14 Oct 2026 06:03:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791982989; x=1792587789; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=f6GuRcuGOLcIK8U1i/42FXzU8VT6SBWZltoaozE4kyo=;
        b=VdIzAD49QgmuSH7L7WpG6XFfQgEKkwvOgo1Wl6LUMkB9TDdMmT9myNANzb0xA0KbF3
         B+k4ZLKLdbMam1RhVlvsXxZjjO+8MGAfrvJi+9nSWISv9LhNL/9E5RJsAvw1/rjYecRX
         lqTDPCI8sMqneUsAvK6El3IUDdHaJBH0w6/ebksZM/znv9Ye9pscbsnTAXR4XiGkzYfB
         i5/GOobx7YuE/rsjGtmFakESdnyezyHI++ONTxTrkhWw9RiZTxPU6OL+s4Jum3z+3Tsv
         ZIQ8ghMKME3bqIl0DCh5DyVYafwZfvfP6V80rTmx+0f0JXDacAUT+vOkBJyg5WT0sbxS
         EpPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791982989; x=1792587789;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f6GuRcuGOLcIK8U1i/42FXzU8VT6SBWZltoaozE4kyo=;
        b=tqNRsM5FHHQfN2K6hWiDB8KlfLrKZjrBh6AJMIoaUQ5yYV1gE9WgslFOotJUDbFUHA
         K1JmkpCYn8QENXRI0xO+oBBOq1aDmKwgygkubPnK0NYvX/L2F8yP3AQlHJgnv0XFATEe
         irNwDQvDEsAPAhQObc0MiJ7xcR9/gCMEHmBxKZNtmH3MbUUgfKWOmjB/XhElw1oLli90
         kmTD1YaF/VNPwPav/27SXeHa85tZpo7SXoiTsUztyOS0z32OHP8T1SZWBOmxetvAZqjP
         mcTxWGFxl5n7uZv23t+a30LQY1BfWhfTw9FFw7jWDgkiJgvsl8O1ZHu446X7/BrcpGrK
         Al1A==
X-Forwarded-Encrypted: i=1; AKwUvBwiGv3knYeFBx0ZF+E5U5nk7TFLuwvM9HLxjPfCQceZ7ZbBZ4ExX+vWgcx7P7EyPETOtU58tvg=@lists.infradead.org
X-Gm-Message-State: AFq9FYJ+gpjPZ0nD72xeZ5ZsY681zHj3M5Br8zrR2Bxfgkj1XSpWfiVk
	21w+xCHZdRJRtTJamnGbn/kTWUyER8spqaFlUPlDMHlxORmrcwO7coGWgje1//gducmrvwI2gDM
	1xaMm6pV5epRAVNTIbAPNdogpaTgCFBz7EJZbZ5nxP0V0RIA/YuUWP0tDTTv8xP+d
X-Gm-Gg: AYBFou0gL5vrfM8t1dLIX2AF6Fuzzxcypd9YjOASWsChqrFosuT3GVsOx6ySJwcaNGI
	SdkUvVE0G/8U+bxfKGgZZypdDbRXNKj6eMrDVC+pqo4jB6EidXm2ErvNeeH4qH1j8eMblHXfusJ
	frDmvDAMMC0HS9fIA0sfJnxJ4Ej8eJpl5YCVxidqVX7Br7LegaAvDaN6yQPqpbYbKWv248LQhs8
	4GFiowmGEb0a4rKuszI1+bziJj9eI29UZ0aZMuRi6x9JxBwnGDT36xRAfrtLsAaaECuAvMrqM2U
	W31zrKIncoifwMLeqtzg0RklhI9j6dXEjlwAdhUR9pfwiYh7OSxKaDBz8hLY4np/QPAvVBKVXgO
	wRSEiTLwN2g==
X-Received: by 2002:a05:6122:6004:b0:5cf:dd67:cb32 with SMTP id 71dfb90a1353d-5e91e5b32e8mr2980469e0c.6.1791982989282;
        Wed, 14 Oct 2026 06:03:09 -0700 (PDT)
X-Received: by 2002:a05:6122:6004:b0:5cf:dd67:cb32 with SMTP id 71dfb90a1353d-5e91e5b32e8mr2980426e0c.6.1791982988613;
        Wed, 14 Oct 2026 06:03:08 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.215])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bcece106sm567795e9.9.2026.10.14.06.03.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 06:03:06 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Wed, 14 Oct 2026 16:02:42 +0300
Subject: [PATCH RFC 4/5] wifi: ath12k: Support MAC address from the
 firmware node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261014-b4-nvmem-efivar-v1-4-187c85f65018@oss.qualcomm.com>
References: <20261014-b4-nvmem-efivar-v1-0-187c85f65018@oss.qualcomm.com>
In-Reply-To: <20261014-b4-nvmem-efivar-v1-0-187c85f65018@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Jeff Johnson <jjohnson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2249;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=o3CLylce040Uzmfs746UWO9V4mjo6gjq7klcNZMuAik=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqz318DQUQZj2g3zPetmcXTmEY2JotdT6sE/6vQ
 tfCBrH1k8mJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCas99fAAKCRAbX0TJAJUV
 VqqnD/wP5JoMwF0ih0vuQgLKP4VIUS96MyhSknO+sjN/Q9Q0BrULeCLswkUyfHTEpsR2Ck1Uevx
 Da3W8gUrShICjvJ4HUdEgOa3vej4kDHzMvVWof6koUhvLnFoeTP6gmyuaNI0e46aFhaqsOroVgu
 yQUVpu5+grq0ES9g+Rdz0Xp8T5sF3iU9Pr9Rk9xcZhZc7hJFdjeriffHikx0qswUGhg3dOoKIHd
 dOIdJAQ9H222ZSuUCOSyTLItTNs6lOb7vDo8OnLIfcakNC8Aywh9AZZnjT8va7G2Rk2DAoDwVYa
 iTesV0M+K/CW5ek8DOSiCwfOFx5cU0EoQHRQOmphakzLzQsU3nMV/gKmgbUeLkfUum2jn8z+38+
 dvu+0FsKanxH/fzteGSNH0QUnTYIDO2vI78BqsqW/RwyNl9bSDSspaisBgbzLosu/Avsfg4abQ1
 M2oia5hnYq9HrYApIxBtivHJLVD7D7tPAu+TFTKW1EDLIEsClDug0TspuRAwpG7/Dw4ZmVX85ok
 4afY1xGZXXvSjUU7RWHD9j+OpsLgz/JK38pL/bB3wPI3zlAvmSI7WAu1JcHeluS8AQ8bjbZf+m+
 JTUb/Q4nAq8SfY/7o9IgJH+rdO1XZHPE0WaglSCFiF9X8S3YGz+t9R5y8HtRu7uuXBhaw/P4jo7
 vnrZnX8znYCQtRg==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-ORIG-GUID: ma2vFos0wQIj2fdugMLxnqj4AxBHJoqK
X-Proofpoint-GUID: ma2vFos0wQIj2fdugMLxnqj4AxBHJoqK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA1MSBTYWx0ZWRfX2apbm6bHYHsN
 WrI7RzDarr24WuRF3EeTiX3/SRPLmUtazJV85Zuemc52G+QXDmEL+360VcBfyzKLuRHdGpzk/3G
 R69ydRLQPEgXzaCLFvgy+oM5uVZsnjBixvFRYo2sICVtVu+tXSIz8g+NMAER2REDXqdATdQB4kt
 MVZTt58xPSthEWV2QfsEZnRmsZbbIAZrxSs7gxpZrs+VsxfBPeUu8iMkw4sNiscrSErREdWLOvN
 uOO9TYyUdQ9uGNSqmW2Drlnh4vCdpGpsUm1cviis/YWxeeHaCgENr/SAgPBLAAhSN7GcbDcD6+x
 45xFJP5IiQD1xRu9TPD99LWvwWuq/5wAPMyyiH0nBIUwhAvdURx3db3LrZt+yJ+sj1h9XQJGCMn
 YK5syW2r/Usqrwt5SMhaHDZsoGVHc0GRcPKh9CZTWupWMrC7kVLZ3BIIG+fCkWEzADFOm+7zO8N
 YG1UwBLAkXTTMzVqsHg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA1MSBTYWx0ZWRfX1oRprrutICFt
 QSFlVXcgC8Agbs4+BBHwJrQ+oLAzP3x0gBPPQ/N7bxE9RMHczDnIkbzgYQZ7IBydM0eg/9W/rCc
 EHwLx3+EsKeGeimDO40vW4E4cMtxiPY=
X-Authority-Analysis: v=2.4 cv=U7AHnuru c=1 sm=1 tr=0 ts=6acf7d8e cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=Rt3kCFFBWhWisHNmluDamg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=miyTlQIDcyHKYiHs0IUA:9 a=QEXdDO2ut3YA:10
 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 adultscore=0 impostorscore=0 bulkscore=0 phishscore=0 suspectscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610140051
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_140313_123992_EEE36164 
X-CRM114-Status: GOOD (  16.28  )
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

Read a MAC address from the device's firmware node (a DT "mac-address"/
"local-mac-address" property, or an nvmem cell named "mac-address" via
device_get_mac_address()), and use it in preference to the address from
the firmware board data. This mirrors what ath10k and ath11k already do
and lets the WLAN MAC be sourced from firmware-provisioned storage such
as a UEFI variable exposed through nvmem.

A device tree / nvmem address takes precedence over the board-data MAC,
so an explicitly provisioned address wins even when the firmware reports
a valid per-pdev address. An all-zero (absent) address is ignored.

Note: the provisioned address must be a valid unicast MAC; a multicast
address (odd first octet) is rejected by nvmem_get_mac_address().

Assisted-by: LLM
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/mac.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 01f8c6572f65..f4d2d0377c8e 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -14878,15 +14878,27 @@ static int ath12k_mac_hw_register(struct ath12k_hw *ah)
 	u32 ht_cap = U32_MAX, antennas_rx = 0, antennas_tx = 0;
 	bool is_6ghz = false, is_raw_mode = false, is_monitor_disable = false;
 	u8 *mac_addr = NULL;
+	u8 mac_from_dt[ETH_ALEN] = {};
 	u8 mbssid_max_interfaces = 0;
 
 	wiphy->max_ap_assoc_sta = 0;
 
+	/*
+	 * Allow a MAC address provided through the device tree (directly or
+	 * via an nvmem cell named "mac-address") to override the one from the
+	 * firmware board data.
+	 */
+	device_get_mac_address(ab->dev, mac_from_dt);
+
 	for_each_ar(ah, ar, i) {
 		u32 ht_cap_info = 0;
 
 		pdev = ar->pdev;
-		if (ar->ab->pdevs_macaddr_valid) {
+		if (!is_zero_ether_addr(mac_from_dt)) {
+			/* A device tree / nvmem address takes precedence. */
+			ether_addr_copy(ar->mac_addr, mac_from_dt);
+			ar->mac_addr[4] += ar->pdev_idx;
+		} else if (ar->ab->pdevs_macaddr_valid) {
 			ether_addr_copy(ar->mac_addr, pdev->mac_addr);
 		} else {
 			ether_addr_copy(ar->mac_addr, ar->ab->mac_addr);

-- 
2.54.0


