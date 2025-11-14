Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 234DACE7AE5
	for <ath12k@archiver.kernel.org>; Fri, 14 Nov 2025 11:16:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CZ8onjE/7OaE9hw5UzyAIQZRdquOeTbEhqDF1iMEQIk=; b=gkhPOH1Gwzay3Vh2QhcAVUjcgu
	gxXHYXN4edNlUkyOhgWySpbnV5bkLsOVXuVsr3GYquelpv2CnJ97yk3pgVYDuQclhHxEkwqK356CF
	Pht0iaiEIwTlW7qb6r7yfjoqh/ZpvORELmpDbcIWq2MPWiPFhYLIApct47rRja+Zn6pSl3ByqNCxq
	duOdpM9bDkoG8nMrzG0tt9WSp7/J3aSUhypZ5gLpwv2zp6vx569lNTKilS7UIhkjNmP3qcv4gccCo
	WFUi5JJ1VsyAA08zrZqXBmWoMfYeiUmBqY6uPkl3JtnnGAtPA5/xX2TtLfauHiurVtAkEodb7r8+H
	M+SYiq5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJrmt-0000000C6So-3Tlm;
	Fri, 14 Nov 2025 11:16:19 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJrmq-0000000C6Rd-2Lk7
	for ath12k@lists.infradead.org;
	Fri, 14 Nov 2025 11:16:18 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AE8RRMu1424135
	for <ath12k@lists.infradead.org>; Fri, 14 Nov 2025 11:16:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CZ8onjE/7OaE9hw5UzyAIQZRdquOeTbEhqDF1iMEQIk=; b=MF5EcXQoprYWPOv2
	pbCM18oA6jCu7BmJjyevTcl0kPdOo9YvGwxrfwmUaan7w++fVoT9Nod0+NrcW90M
	//93an4TyDQZ+BC68tumTS1yKqSn+lfDMQI9ca6afEGcGUJSzKHX0/zAAylE2NEo
	+IVCP+jmNV5LAMIihOHiIdAWAQYmwnvbcHR71KZOFVTuoQYbK0f+WS2+LMcmXjV3
	S+xZg8fkrZCHwfZNyI4A29Nf+AvKOeRc8KdmZxUDb6cu+n9b5WEgs/AEI0oZIqPE
	bsnLr0UQYUT2r5eMMzxh9w964RlnpzuvookeT5FUkHkY26l3uRjUdWY1kLHwvUi2
	p4vXsQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4adr9g1x28-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 14 Nov 2025 11:16:15 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-7a43210187cso1840283b3a.3
        for <ath12k@lists.infradead.org>; Fri, 14 Nov 2025 03:16:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763118974; x=1763723774; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CZ8onjE/7OaE9hw5UzyAIQZRdquOeTbEhqDF1iMEQIk=;
        b=ims58d3e0YpvzkCW3s1G5rZrIKD2rdK0Zta5RNo+LWWfXk+E82H+k1tP9D1COASYYb
         7XDSDfhLhlCmWQLg6YC5boZY/JBxZjl9lwDTCZ/pCBArNVNxEA6AxEpomhMffIohe2pL
         kMVilioWqZpjgv2euAwiyMiqny2XOWfpq1bNbCT0q0A7sc+mc/CZ/P280ZBxiXVTpfKw
         yOkj1iU8RXrDJj9zrXwoC45mQjOq0o+N+BfFQLXTGK7xoA3r3j9ZAIWYw0UNTnF2ezks
         EHgx1W9EVa+CY0WWR0f+6JTrvBe9biynJ9WWZFpJbxwUF2ULCmnJ3AtZgnxPv5euh77r
         6qEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763118974; x=1763723774;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CZ8onjE/7OaE9hw5UzyAIQZRdquOeTbEhqDF1iMEQIk=;
        b=faBXj1XDToLV7Be8K2o7Ul/MG4O9Kv1TLFFHIs+ma35FII5T8Z8naeU5nBndDLBTJg
         9pFubU3KYNUDloBrg+Xi0OcP6jDl6c9BtEaV0w5mCVVrvVAwP+A+VDt8kkBuqM2eVBDv
         /evI5FQ+GWAYYpAqcyhYak2CBwRmtAHquezPZOEl3LiIDS83x9cF4ByhvBXMHMiL8o5p
         vFLB3FkHrxjG3PzPorLOJBDtwmz4q4u8S0pXNNoFI1qsGbGcdTUxAzesBGof/9O6QwjW
         RwWpRdnOCrz2A3izH16WjlhtH7PTw4zGpvMeNTmFHgjFDtZ/baarwcE8LvBC8flFq4KD
         tsVA==
X-Forwarded-Encrypted: i=1; AJvYcCUDSf8KGB2HpabwvPYfSTJPa8xdE/PXSK+g2K2FUj1iPAWCGGlTPCR+Y9Jsxo0UycwN12aD9Qk=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy4raOuwHoSkys3zAGtY57iNb2qfXsPQlsHfaFXnZ3kHV8Jl6ED
	t45WPeIGvNdLAKvQizuZXuihjM8TTIYB/4kiBJntq61NGtPWfqg84EFGdWJKdUDttNe5nqBwuMu
	rSfzBeTtCfP7AZgO3v9iHRb1HxO4VTWdq2h5B48dDspq3YWizRvPIDDVk1d30FhUZ
X-Gm-Gg: ASbGncu/Y+rzzd+idP3A24d8tO80U/4m5SOtD41TibP6s94diJXVJ8JP3ZYwMedxggE
	VOWrtb2YPXhOkeR+kU7i5bCLlC+efLvZQFlvEbbsd3C5AST4Keq803DIyLBt40wkTctJff+9tk2
	/UoDe9jGlzUlN5SfD42JesEeu89zbRul4Lmq5m/uWN/9HoGTZixg3JxErIGAsDCZclYdZBLTnta
	+Z6RN0EcOxxcY5mE1QwZLVXB+A1/qaKOOH0Lvp89o8IMYcIO+zK70nXtbF3Xhjcqtb1JuanYFEy
	dLWWQAaGdsO1QRpRCXwEPC6fiShEs845UJ8h1w1/l6ni7POa1YFsmug19H4XUwMo8PibY3Npo0B
	bBPz+SqSi6+oeibM=
X-Received: by 2002:a05:6a21:e098:b0:342:f5bc:7ce5 with SMTP id adf61e73a8af0-35ba0189681mr3732163637.19.1763118974417;
        Fri, 14 Nov 2025 03:16:14 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFod3yfShExltGVniSBUsOUaxRRfujKg3U2KnJt2F3JQHHj5TZebVtDeHhgIkrZk/ReQ7B36w==
X-Received: by 2002:a05:6a21:e098:b0:342:f5bc:7ce5 with SMTP id adf61e73a8af0-35ba0189681mr3732119637.19.1763118973893;
        Fri, 14 Nov 2025 03:16:13 -0800 (PST)
Received: from work ([117.213.102.44])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-bc36db21e8esm4486192a12.5.2025.11.14.03.16.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Nov 2025 03:16:13 -0800 (PST)
Date: Fri, 14 Nov 2025 16:46:00 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: srinivas.kandagatla@oss.qualcomm.com, Jeff Johnson <jjohnson@kernel.org>,
        Johannes Berg <johannes@sipsolutions.net>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-wireless@vger.kernel.org,
        linux-kernel@vger.kernel.org, ath10k@lists.infradead.org,
        ath11k@lists.infradead.org, devicetree@vger.kernel.org,
        ath12k@lists.infradead.org,
        Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
Subject: Re: [PATCH 1/2] wifi: ath: Use static calibration variant table for
 devicetree platforms
Message-ID: <kn24jkn77ydcrn23xz6z27cvaclksmeb3ic7pr24lxsqediugl@ubkf5t4wyyrq>
References: <20251114-ath-variant-tbl-v1-0-a9adfc49e3f3@oss.qualcomm.com>
 <20251114-ath-variant-tbl-v1-1-a9adfc49e3f3@oss.qualcomm.com>
 <3a951821-14b1-464e-b1da-05a95f4164af@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3a951821-14b1-464e-b1da-05a95f4164af@kernel.org>
X-Authority-Analysis: v=2.4 cv=L+AQguT8 c=1 sm=1 tr=0 ts=69170f7f cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=Nd/jlyMbCgud2ZEcqXkYLA==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=7djovcsh0G9526kC70UA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE0MDA4OSBTYWx0ZWRfX8SvY4/si4TK4
 Yciu1rXhZi1bDLFEae6pv7BBowkgN7J+O/x6mQzmZN34GTEviJaaAJhOLoun2fpJyO4ru6nvuiV
 i8x64BUBiXM2uvUtDXQNR3zxPLt8+hU3peUzDZDDIdTPguIUjw78lZ62dSQiSktgdec5BZBxo5W
 fyZpj2DGl/KFwPy1ah9VlyiRC5sZIo0KYolFezwUF5eVYQ1SAh9krxA+FzP2IXKnx1iqyd9XQdC
 +x8rXk4ZLHNUpVnt1xUpaVUXg3YEqcjBKRsPlSUGOqqu3yEyapQfhJ07VRGQTLXx7+7dN/UoaNy
 adzEuvAGP5tpHKRHPsegnhNR+pQdqw7ubQyxDO2SxhvQmKC5g50kgcSnZH9VewpREKpwmNCzYyX
 x5Bk5t4Hh91tgVuv+bsQ6+OOEsDfmw==
X-Proofpoint-ORIG-GUID: nnmHshlQEH17m3mI9i5GlVwk9UG7YSDN
X-Proofpoint-GUID: nnmHshlQEH17m3mI9i5GlVwk9UG7YSDN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-14_03,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 impostorscore=0 priorityscore=1501 adultscore=0
 clxscore=1015 bulkscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511140089
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_031617_513077_DB651254 
X-CRM114-Status: GOOD (  33.61  )
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

+ Srini

On Fri, Nov 14, 2025 at 11:45:30AM +0100, Krzysztof Kozlowski wrote:
> On 14/11/2025 11:22, Manivannan Sadhasivam wrote:
> > On devicetree platforms, ath{10k/11k} drivers rely on the presence of the
> > 'qcom,*calibration-variant' property to select the correct calibration data
> > for device variants with colliding IDs.
> > 
> > But this property based selection has its own downside that it needs to be
> > added to the devicetree node of the WLAN device, especially for PCI based
> > devices. Currently, the users/vendors are forced to hardcode this property
> > in the PCI device node. If a different device need to be attached to the
> > slot, then the devicetree node also has to be changed. This approach is not
> > scalable and creates a bad user experience.
> > 
> > To get rid of this requirement, this commit introduces a static calibration
> > variant table ath_calib_variant_table[], consisting of the platform model
> > and the calibration variant for all upstream supported devices. The entries
> > of this table are derived from the upstream DTS files.
> > 
> > The newly introduced helper, ath_get_calib_variant() will parse the model
> > name from devicetree and use it to do the variant lookup during runtime. If
> > the platform model name doesn't match, it will fallback to the devicetree
> > property based lookup.
> > 
> > Going forward, the devicetree based lookup will be deprecated and this
> > table will be used exclusively for devices connected to the devicetree
> > based host platforms.
> > 
> > Tested-on: WCN6750 hw1.0 AHB WLAN.MSL.2.0.c2-00204-QCAMSLSWPLZ-1
> > 
> > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> > ---
> >  drivers/net/wireless/ath/ath.h         | 98 ++++++++++++++++++++++++++++++++++
> >  drivers/net/wireless/ath/ath10k/core.c |  5 ++
> >  drivers/net/wireless/ath/ath11k/core.c |  7 +++
> >  3 files changed, 110 insertions(+)
> > 
> > diff --git a/drivers/net/wireless/ath/ath.h b/drivers/net/wireless/ath/ath.h
> > index 34654f710d8a1e63f65a47d4602e2035262a4d9e..d0a12151b7fc13355161c48ba1fb200e4617ed11 100644
> > --- a/drivers/net/wireless/ath/ath.h
> > +++ b/drivers/net/wireless/ath/ath.h
> > @@ -21,6 +21,7 @@
> >  #include <linux/skbuff.h>
> >  #include <linux/if_ether.h>
> >  #include <linux/spinlock.h>
> > +#include <linux/of.h>
> >  #include <net/mac80211.h>
> >  
> >  /*
> > @@ -336,4 +337,101 @@ static inline const char *ath_bus_type_to_string(enum ath_bus_type bustype)
> >  	return ath_bus_type_strings[bustype];
> >  }
> >  
> > +static const struct __ath_calib_variant_table {
> > +	const char *machine;
> > +	const char *variant;
> > +} ath_calib_variant_table[] = {
> > +	{ "ALFA Network AP120C-AC", "ALFA-Network-AP120C-AC" },
> > +	{ "8devices Jalapeno", "8devices-Jalapeno" },
> > +	{ "Google cozmo board", "GO_COZMO" },
> > +	{ "Google damu board", "GO_DAMU" },
> > +	{ "Google fennel sku1 board", "GO_FENNEL" },
> > +	{ "Google fennel sku6 board", "GO_FENNEL" },
> > +	{ "Google fennel sku7 board", "GO_FENNEL" },
> 
> Are these top-machine models? If so, you cannot use them. The value is
> user-informative, not ABI. If you wanted to use them, you would need to
> document the ABI.
> 

I had this question initially, but Srini convinced me it is OK to use it in the
driver as they do it in audio :)

> Just use compatible, that's the entire point of compatible.
> 

Ok!

- Mani

-- 
மணிவண்ணன் சதாசிவம்

