Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99B87CCA462
	for <ath12k@archiver.kernel.org>; Fri, 16 Oct 2026 03:23:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6aNW9dnDX6TbyEdH720nm0hjQAKn0nJnCofDm4yX0So=; b=aQL+EBc5fgsAjLpxx9OGTXVlkW
	ey59s0GR+niV2TPnGK5zYDKh2Cx+aUf7XlJqQ69aPu8XV9aAwP+kx4/swh91zBYpDbHksIHv3YB/P
	H2fukzvpG5EmfsD8ccaB42XxYgxXGHLSfJ/04FZS7o9N/i4z0JZwBhAz5xlmrL/YW5+yo7ke4/8Zg
	pPSvptWj3RlCptEV1hLL0nGkj9csFv321qlt57RgK1zgYH3LbNtQ/MCGV4IYB3jZPhQkI3wM6lIHk
	5/NY3OiunqTDqRaqkaoMx47E8jlqApSadXx+rUQ/TMshUK8nheTJG7jFwmajEFzSI51yVyFiQrWNM
	361arVRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHYXG-00000001q94-1G4q;
	Fri, 16 Oct 2026 03:23:10 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHYXE-00000001q7e-42SM
	for ath12k@bombadil.infradead.org;
	Fri, 16 Oct 2026 03:23:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Cc:To:In-Reply-To:References:Message-Id
	:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=6aNW9dnDX6TbyEdH720nm0hjQAKn0nJnCofDm4yX0So=; b=v+QkNbtskwoSwmvDhgBiuBVWMR
	aZafSfn7pxUJF50SOV5Dn8hHI8WxVbbza8UeW4kONZ42C+FrSj9juLOVbo8vaaEPCpHrTUDFBON49
	57v7+R4qXPc3wG0qySRrptuP9olDAzYQv/leieOXCrXdR5RfmIKXk7khZpHRLaD5Igly2giejmeLl
	4U1fQjxCqiXdE8rUItWpOVK2nyRjUXhvITwsrnjoHWaplDiS32QVXCVt3HZwWSC+idJcI0c9RkXSq
	EnomDgs49E7bNctEJXX4g4iWF2Ff2f2qm8hTvLwPvFHax2M188Ut3ysdIrSrVtUWhMD3qtGSNlkG/
	RRPTshfw==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by casper.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHYXB-00000000ftr-1vlC
	for ath12k@lists.infradead.org;
	Fri, 16 Oct 2026 03:23:07 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69FLmUCT4126284
	for <ath12k@lists.infradead.org>; Fri, 16 Oct 2026 03:23:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6aNW9dnDX6TbyEdH720nm0hjQAKn0nJnCofDm4yX0So=; b=GSEBLOf5hxVD7pUD
	wdKA6JG1oQ3LCTjdGEFgFpKJ/hYsgZuaO2OfhgeAdEzDMLmKmAyQSDp4kQCBxe4q
	nx9XiYVmkDHoVjQnKvbUeSohHDcg42eh+XLj32c4/PISuCIIkj3sWmVwzlWL5Q4q
	TnH4kKr1cWgRPKdYIcb+vXxt04LSm8qoMjdRr9k+lACfirQp7R1/9rIiKgbZRWUX
	8fCotgLkV9MDf9Mah8Fe0AQ4MFZ2rjycZf/JEZyiq36+H3/9wmgeYjXhPaehuKOt
	QKgzq+wfwh3NTMqCFhn6JwTXa6RMAaF510CuiL32AY/BJ/viwOrIDBovkyhQNAO8
	0SNKSw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hb19m2f1t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 16 Oct 2026 03:23:03 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-3510d0baf63so8211845eec.1
        for <ath12k@lists.infradead.org>; Thu, 15 Oct 2026 20:23:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792120983; x=1792725783; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6aNW9dnDX6TbyEdH720nm0hjQAKn0nJnCofDm4yX0So=;
        b=bGhUWf9z/fKr5AlrjQh3kWg/6djwmfAu0fS+IWlOdQKCYbqADLGNA9jqOTREDQmQxG
         7GqnNFaQlnLzUgm7zganm2uFi4yM0/oUfg3p3d34BMi1ZIIp7SVgSv7yTLwhKE7obQV3
         ylsEzn2dsDjVeubVRiOhXyhSP74Rqji5G5kNEb7WBdIBEfFPscp5fvvnDp5lAotaumgw
         LhYH+/iXAEuuaMT0ofHR8ybRvZZoBBQvWYrY1mfq7kuILZK2TrbhL1cJSGSYHMtrSezL
         DxA2+ulCCLECwEf5I9aFyY0Iab6TXp7+CM5rXHgQE7epBwN6Ply/xjRD4K3OTQwUjN0K
         5SOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792120983; x=1792725783;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6aNW9dnDX6TbyEdH720nm0hjQAKn0nJnCofDm4yX0So=;
        b=roVfW2KZczZcfNwzkkL7Yu1ZfiEMJpMOIjQKZJRMRHEe5IuOMgF3Zcb19FdnfBpn0K
         c2eAMrwZnwaes3Ok3RAfRvOKeiEVVHnrauFn/1BJ3hiQhxmNnbDmDeQ8D/61Fctk0iai
         rJiNlmJXh1WB9qC/MGwvxFq9KT5P6SOP3/0g5l4MvyDskxdTgDFjA7l/flOr6WqQ9YcP
         WcQCUCo+9XdIeLqbayYmt4KEo1PpMErfkawJnrl7/uHeYIJtB2ze1hkR9xjsMd8Twk0a
         NDrppUs/eoAmnl43Ai4sYDBC7SEML9ex+Rk8Ow1fTPcQVNgZjbONdjM1cZxAK61yCni2
         I5Aw==
X-Forwarded-Encrypted: i=1; AKwUvBzbdCO+uX2iQSYRK15pu7+8Kj+mzCmEdgLJQJKxPjCnT72+SHzX6f6zp6OZNGJsigEMN1JSotg=@lists.infradead.org
X-Gm-Message-State: AFq9FYLr41FWUVcnH02fLoK0EeaaXTepPwxPhE7IoVuJZ8V3/sRFMpgc
	YrTLka6qdNiIMxasW/Dldi4C2ImVN0phpl3h1NiLXZLXJ9VVPx+EKmI5Qci00Qh1UdQnhheLFX/
	Rle1ravDITUV8Nkq+7STdjFE6a1RksZ70zajH9O34zzn1eqaAtw/BRf0HWzH36GR7
X-Gm-Gg: AYBFou15LmLqshUXGNIFOG+IFJ7FoYYLjkakU0FLIwq0zrwIVcOS1Eg5kGB8DIxJYPl
	zhjOzWk/QszH87kGVi0QXjoztL6UkcoCbzZkopCcmsEt/RUwzBGmus5W3hLi6KSfEwTLZH3PT0P
	i3C+J2dUw7dDv3yBGaExY00e+Zg5uPMdZ0zaRUf2kyOo4FGzq/oDATZ9h1g9XmK8x8rpFQpw5Kw
	9p4UGG0ZsOogPoVXOAeOGTcBPSB2wxfiBYRFYWPUWXemdRu1nTeLErT6J40GTKCuO3R1pjXT49Y
	HYlzDdEwA8OjN+ETY1NBluBlTOPK9s53iO2L24FXb0uyhWDdiLXswgytqzEbr7IfjnyRIy4W0e/
	ApArhYkj/Xnq+qodc8wbrRgC0YxU0BclG2tlAnRE7b7SBlawmp3lLtdw/BU3zvwop2gLrx1/WsJ
	dg7Cbs4MWiULBKL+fYgjyElA==
X-Received: by 2002:a05:693c:2289:b0:34b:5ab2:e200 with SMTP id 5a478bee46e88-3537e0788bemr39108237eec.14.1792120982780;
        Thu, 15 Oct 2026 20:23:02 -0700 (PDT)
X-Received: by 2002:a05:693c:2289:b0:34b:5ab2:e200 with SMTP id 5a478bee46e88-3537e0788bemr39108183eec.14.1792120982148;
        Thu, 15 Oct 2026 20:23:02 -0700 (PDT)
Received: from hu-aarasahu-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-360819be413sm2256698eec.13.2026.10.15.20.22.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 20:23:01 -0700 (PDT)
From: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
Date: Fri, 16 Oct 2026 08:51:53 +0530
Subject: [PATCH ath-next v2 16/17] wifi: ath12k: Resolve userPD ID per
 device
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-mpp-bringup-v2-16-f510c33bfcf5@oss.qualcomm.com>
References: <20261016-mpp-bringup-v2-0-f510c33bfcf5@oss.qualcomm.com>
In-Reply-To: <20261016-mpp-bringup-v2-0-f510c33bfcf5@oss.qualcomm.com>
To: Johannes Berg <johannes@sipsolutions.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ath12k@lists.infradead.org,
        Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Authority-Analysis: v=2.4 cv=aLdlOr9m c=1 sm=1 tr=0 ts=6ad19897 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=OMOyA7uMCkrHFcBVPHAA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-ORIG-GUID: SsXRgkLHJnWqIdFYczGOvesdIvvIdraV
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDAxMiBTYWx0ZWRfXy6Ljb4MFqmaC
 ZI6nQXcrWqLmreXNPnV1uufakq2xqDYHsCz9N1f7Wd1TdOFX+ZwKV4XKghWH+E+hhF/12qta/rA
 braNrybjvdlmIu40t9eg0838lGBtdw8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDAxMiBTYWx0ZWRfX53W7do7ttxnx
 JWvskMbqCYJNlEJYauUuUN+Eooz31FDizxXULAVJtPpXpvl5KPPWe7DKbJ1AgxVC2Q+T9OkB8Ob
 NQuRxHMM87PkIUlAs6A9kolRDomh/ZbUPUkKlwnhD3VJ2oFmOL+8VJqm5wWzhFdX5kHV0xwW3wb
 nFP9aHO39nG9f9cZIT1tzoRAt9P3YdV5yzLxX/UzJ57byfLdkg/jygY6qKF5z5z/EOuIdB7DWEJ
 0FcS1VtrXWvWW8kPz+KrheiYfQggz8bAhU3cKlqs5B/CAuAHx23LCopxCdT7E95HB/AEbXrfcEn
 GnXKQ+Ovi262e+HQlZ8G5wjw7uMZ6Ci8M7JzHM4QTb683UzbwnSGZ2zkiNI6nwIuG9aWy6ni+NZ
 EfWgYdS9Sym2MT7dD/3gydaPm7SZNo/cVvdfD0Lv94VBw4p0j6LAs6Obc1I8L/mTXEESNCcd73l
 XhlcBbbs7yqn4Z9RRYA==
X-Proofpoint-GUID: SsXRgkLHJnWqIdFYczGOvesdIvvIdraV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 clxscore=1015 malwarescore=0 adultscore=0
 suspectscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160012
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_042305_706600_6A3B927A 
X-CRM114-Status: GOOD (  16.57  )
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

Currently, the userPD ID is hard-coded during AHB probe. This does not
work for multi-PD platforms where different devices can have different
userPD IDs even when they use the same compatible string.

Resolve the userPD ID based on the device address so that the correct ID
is assigned to each device. The userPD ID is used to determine the
firmware name and PAS ID for firmware authentication.

Also set the multi-PD support based on the AHB device descriptor.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1
Tested-on: IPQ5332 hw1.0 AHB WLAN.WBE.1.6-01322-QCAHKSWPL_SILICONZ-1
Tested-on: QCN6432 hw1.0 AHB WLAN.WBE.1.6-01322-QCAHKSWPL_SILICONZ-1

Signed-off-by: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/wifi7/ahb.c | 27 ++++++++++++++++++++++++++-
 1 file changed, 26 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/wifi7/ahb.c b/drivers/net/wireless/ath/ath12k/wifi7/ahb.c
index bff48b2fe124..889361e637af 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/ahb.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/ahb.c
@@ -16,6 +16,10 @@
 #include "core.h"
 #include "hal.h"
 
+static const struct ath12k_ahb_userpd_map ath12k_wifi7_ahb_userpd_map[] = {
+	{ .io_start = 0x0c000000, .upd_id = ATH12K_AHB_USERPD_ID_0 },
+};
+
 static const struct ath12k_ahb_desc ath12k_wifi7_ahb_desc[] = {
 	[ATH12K_HW_IPQ5332_HW10] = {
 		.hw_rev = ATH12K_HW_IPQ5332_HW10,
@@ -43,6 +47,26 @@ static const struct of_device_id ath12k_wifi7_ahb_of_match[] = {
 
 MODULE_DEVICE_TABLE(of, ath12k_wifi7_ahb_of_match);
 
+static u32 ath12k_wifi7_ahb_get_userpd_id(struct ath12k_base *ab)
+{
+	const struct ath12k_ahb_userpd_map *map;
+	struct resource *res;
+	size_t i;
+
+	res = platform_get_resource(ab->pdev, IORESOURCE_MEM, 0);
+	if (!res)
+		return 0;
+
+	for (i = 0; i < ARRAY_SIZE(ath12k_wifi7_ahb_userpd_map); i++) {
+		map = &ath12k_wifi7_ahb_userpd_map[i];
+
+		if (map->io_start == res->start)
+			return map->upd_id;
+	}
+
+	return 0;
+}
+
 static int ath12k_wifi7_ahb_probe(struct platform_device *pdev)
 {
 	const struct ath12k_ahb_desc *desc;
@@ -60,7 +84,8 @@ static int ath12k_wifi7_ahb_probe(struct platform_device *pdev)
 	ab->hw_rev = desc->hw_rev;
 	ab->hif.ops = desc->ops;
 	ab_ahb->scm_auth_enabled = desc->auth_enabled;
-	ab_ahb->userpd_id = ATH12K_AHB_USERPD_ID_0;
+	ab_ahb->supports_multipd = desc->supports_multipd;
+	ab_ahb->userpd_id = ath12k_wifi7_ahb_get_userpd_id(ab);
 	if (!ab_ahb->userpd_id)
 		return -EOPNOTSUPP;
 

-- 
2.34.1


