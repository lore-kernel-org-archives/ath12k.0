Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C538AC53219
	for <ath12k@archiver.kernel.org>; Wed, 29 Jul 2026 15:26:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TNT5GXQJAMiAcSilkiUxETqrPzWUif0/ef1SRCtWtiA=; b=iGuMTjP3zokobd/NlP3Y8rJc5w
	3POq2i676G91/bkSJ+dDJMiklrSy3Cf+8UUhkkD+nuc8GTTcwUCT9cGYois1tNr+E3oUGtujIVUrJ
	QxdF8nONIcKf/aQMjidPcRbTpY1ztoF3zbnmlQ1CHx0t5V5SLYiSX+YnNHuLdSiNdOnN1GR+MGV4R
	q45fB/OrChPIeQWjbSjuntjMEIwj7TAN/siygI9DCY4CoSdZr5GUG9eX6KtE9RyphOeJnl/10hYl6
	IpczLkRPUlnnLvegvfRTCPoe1jLHX/yXWBRrw7bVY592gRD/oRCV/GQCF10d0uzHxuTLRf7rgihk9
	9sJJOf3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp6B0-00000008OvC-22kj;
	Wed, 29 Jul 2026 15:26:34 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp6Aw-00000008Os8-2sXL
	for ath12k@lists.infradead.org;
	Wed, 29 Jul 2026 15:26:32 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66TF3LGi2108372
	for <ath12k@lists.infradead.org>; Wed, 29 Jul 2026 15:26:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TNT5GXQJAMiAcSilkiUxETqrPzWUif0/ef1SRCtWtiA=; b=oBoQKMK9ee9Ob5sR
	zUwfVCqHvn0fjGg5+CtDAbD6MBit2H5Hq/yMhiK9RC0aaOv+GvaTG3ky4d5VQhGs
	NsI4p9Xk9rNC7B30y5lrXU2cwzrMa5I1zd7ZcyEC6ZyLWt1hIeU62m4iXN7AlicZ
	eyju1C4ay2xFMpeF90Fpkq+44CuS6MDOcM07D+onU/mcA1z4+YE2+aFI0Nv4p7Ux
	5GO3NCJrpxJHnzYBZmEn2/QmMTCgefikJdWBv7okHcqI/WdffZ9zZUCNpDCuBL7a
	QM9YupFw6EwsvJ6XTQS5L3O7C18JuLb+Rm9gk1eQETb/KXnFyLy3nMCaNCeYhHzi
	KTPapA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fqkds8a7k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 29 Jul 2026 15:26:30 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cccfa32670so12148715ad.2
        for <ath12k@lists.infradead.org>; Wed, 29 Jul 2026 08:26:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785338790; x=1785943590; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TNT5GXQJAMiAcSilkiUxETqrPzWUif0/ef1SRCtWtiA=;
        b=OnSZPmX3kGpIuqa1B4abn9A6WfhuWCvaRp5iYlOAn3l3UdhpzJh7VLceIQ+RbE3PIa
         0x49PR/Cc7L4yPy9n710yGMfCqNPrwpo8L8zNkUsO9CeiLR5bD6/UQkxmisMFokBAeGU
         1Jia9nCBm+7Ylj1yqUvRxxut141FwyI0DQ9DaikTyQENhyecPzqfmY7l50lTLopVgSYn
         YfdyiZoM80zZlxKiRPlZgBi7KpmDcyGIrqtA+vxxjNWX1YXXprH/c2nPm4RGYTyoLKmV
         SiDaYjex5meBE8HraVfTwLuGgcYXYD3QG3JqhGrHkJm4ayGm+OIL0LiwumEqvJPI249m
         0rhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785338790; x=1785943590;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TNT5GXQJAMiAcSilkiUxETqrPzWUif0/ef1SRCtWtiA=;
        b=i0S0ELDQu9WGkna5xGOw70BtxnSY9JXPKZofrljxCgwEX3W15r+dvduwhJSL4CCmXU
         bIox/DUs+rBuCsLzklGFz7p5dUSDpkLT2kZaUVEbyoQzayql4iZfkncifWq3DIrHzyTz
         W9CKc/PvHrkS0Uqb00BUv1jazKnF9BBZ34WfXK9uFr45vS9WgwUzr21HYWVa+Bppylye
         E3An3tvqPhYilwjTg2c5jvRhCw6Jzzr4urcRpTvg6nX5TYiEAnBHgeU43pEvLl1zwzSC
         noSS7pZ9g2YImAcEvWPHo6p/KJqKeHO1hw2d1KnQ6+QmWz2ww5ZJOs3GTE65D1kpAHUs
         JWGw==
X-Forwarded-Encrypted: i=1; AHgh+RpaIzariX7vDBudJxjn8gJG0TpHXDmblexn8Hct9JIRfHFx85YUJeYwTORgzI4ufVGXCHPtM7g=@lists.infradead.org
X-Gm-Message-State: AOJu0YwaAv7ynHsZgSkOqwLaXnW5Hrb6pQhGPh/uN8EJVBDZrV8+fPrl
	E5LwFqk3qf47LF00c7rd0eClRyGpacoDBLcMkwo1RbG+8uCeUSIhJ1fCDPHoGURTydvqvMVF/Fh
	KZjskXT7N2GvDOZkivDODoRerOO2Xotl7HVD+Dv/VHKsySaAvobl+qh9sdLfiyaQ4
X-Gm-Gg: AR+sD10ZDNoBmSV/9f22u57oHEqoeD+dkTNM34SlBz0fzCzDGiOu0j0/39Mzz5I1PoZ
	47LConmp535RuQ+0FCDMRpNWMUu4mTmSsp22EC1rWfhJ2ECjtLBTCi9/bd1ArZTDc97dIZCd1c3
	R3t+inZ2hK6lGU777isVRh41O1D9ApVqkmvLfMwdKe1h4wSQO7HnPuZdHmUP3ZR0KAwKz+wJdI5
	SDn+qqcO97RWePj+AjcfmSTR9oyWOJxMAVF9oHZ1oamH7MmrfRjHsZmsbvABcUEhrAuFsZzx//Y
	4XdgVppkDYbHxnfiyWaxBIAlqsWYDQasXkLqwlFIJ/vIbfKG652eHa49LXiAtfbO3RQY/V6lw4H
	E5tX5Wi5e5NccxHd6MZ1sqQmyXJRyl78vF6FDeq/QsXBKoO5gotGFBPs=
X-Received: by 2002:a17:903:3c6e:b0:2c9:d539:61e7 with SMTP id d9443c01a7336-2d015c4e34bmr81145165ad.19.1785338789597;
        Wed, 29 Jul 2026 08:26:29 -0700 (PDT)
X-Received: by 2002:a17:903:3c6e:b0:2c9:d539:61e7 with SMTP id d9443c01a7336-2d015c4e34bmr81144805ad.19.1785338789207;
        Wed, 29 Jul 2026 08:26:29 -0700 (PDT)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31504d480c5sm18005300eec.25.2026.07.29.08.26.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 08:26:28 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Date: Wed, 29 Jul 2026 08:26:25 -0700
Subject: [PATCH ath-next 1/2] wifi: ath12k: fix stride mismatch in
 mac_phy_caps_parse()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260729-mac_phy_caps_parse-stride-mismatch-v1-1-077a1a0c50d8@oss.qualcomm.com>
References: <20260729-mac_phy_caps_parse-stride-mismatch-v1-0-077a1a0c50d8@oss.qualcomm.com>
In-Reply-To: <20260729-mac_phy_caps_parse-stride-mismatch-v1-0-077a1a0c50d8@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: ath11k@lists.infradead.org, ath12k@lists.infradead.org,
        linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDEyNCBTYWx0ZWRfX3MTt+nvyyYhx
 V7wUMFFsfZ5mPicn4vsNY4djKe5QrjRL1lJScFFZyZ+ZyD4UV3moqhUG97MXqJghFt/F6Yg7yaz
 OKMryXhrg/o2RMpahwEKJKjf+dkCnZ0=
X-Proofpoint-ORIG-GUID: p0FjVmKAHUtZ7Y57HtQ5qLHAY7x55MWX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDEyNCBTYWx0ZWRfXxZPGCUBn3HzG
 tnMJ0EmVxdWtv0Gepsud/pZHvUlDzJkIBT7fr2gTeNdfg7Rqstx2t8JQLkrGKVH3puPOlhrByVW
 MKEqNsmp66opfW+O7SPz0FRrcu2UsbmoOxj3Z7N2fXERaZ/W/aP8mfr+sgN3GDZ9neJ82qbeqRy
 3knzs5ib5+1peRr1lZS5B/sk1nFi8nE9ORbeflNGCtbSP6uIv73/Ad6IW+2sW25FsVmlK2tUU30
 G0bLMliDhb/dcuWqdBr0vk7qvvtmDYN8ihfXfPbleiaItCjUKmgY62/ZGThH43kyJgInjfQbJYI
 y6Fl/bUWesKt6eaUOlak+IONum6o265yTcNMFm30ut6+eki57UdLVXPnzsOcvmka24ZCqqOqF/v
 LeD5mjrN7rEry2bLrcp6INtaYtZdORxtHraTQprFFMPF9UQnnfCBh5ShJhlBYBZeCp0l/2s2V1J
 1WcJUT+9iwmuslNDRtQ==
X-Authority-Analysis: v=2.4 cv=VJTtWdPX c=1 sm=1 tr=0 ts=6a6a1ba6 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=TQlc2wDWUpY00yvoUuwA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: p0FjVmKAHUtZ7Y57HtQ5qLHAY7x55MWX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_06,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 malwarescore=0 spamscore=0 phishscore=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607290124
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_082630_726250_9C9BC492 
X-CRM114-Status: GOOD (  13.36  )
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

Currently, in ath12k_wmi_mac_phy_caps_parse(), kzalloc() sizes the
mac_phy_caps buffer as tot_phy_id * len, where len is clamped to
min(firmware_len, sizeof(struct ath12k_wmi_mac_phy_caps_params)). The
subsequent memcpy() destination advances by sizeof(full struct) per slot
via C pointer arithmetic, not by the clamped len. When firmware sends
short TLVs, the second and later slots are written past the end of the
allocation.

The reader in ath12k_pull_mac_phy_cap_svc_ready_ext() also indexes the
buffer with full-struct pointer arithmetic, so the allocation must match
that stride.

Fix by using kzalloc_objs(), which derives the element size from the
pointer type, making allocation size and pointer stride provably
consistent regardless of what len the firmware provides.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3

Fixes: d889913205cf ("wifi: ath12k: driver for Qualcomm Wi-Fi 7 devices")
Assisted-by: Claude:claude-sonnet-4-6
Signed-off-by: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/wmi.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/wmi.c b/drivers/net/wireless/ath/ath12k/wmi.c
index 672eae237ac6..d466baf5e90a 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.c
+++ b/drivers/net/wireless/ath/ath12k/wmi.c
@@ -4765,14 +4765,16 @@ static int ath12k_wmi_mac_phy_caps_parse(struct ath12k_base *soc,
 	if (svc_rdy_ext->n_mac_phy_caps >= svc_rdy_ext->tot_phy_id)
 		return -ENOBUFS;
 
-	len = min_t(u16, len, sizeof(struct ath12k_wmi_mac_phy_caps_params));
 	if (!svc_rdy_ext->n_mac_phy_caps) {
-		svc_rdy_ext->mac_phy_caps = kzalloc((svc_rdy_ext->tot_phy_id) * len,
-						    GFP_ATOMIC);
+		svc_rdy_ext->mac_phy_caps =
+			kzalloc_objs(*svc_rdy_ext->mac_phy_caps,
+				     svc_rdy_ext->tot_phy_id,
+				     GFP_ATOMIC);
 		if (!svc_rdy_ext->mac_phy_caps)
 			return -ENOMEM;
 	}
 
+	len = min_t(u16, len, sizeof(struct ath12k_wmi_mac_phy_caps_params));
 	memcpy(svc_rdy_ext->mac_phy_caps + svc_rdy_ext->n_mac_phy_caps, ptr, len);
 	svc_rdy_ext->n_mac_phy_caps++;
 	return 0;

-- 
2.43.0


