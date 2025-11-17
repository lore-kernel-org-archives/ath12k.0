Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DA13CEBF91
	for <ath12k@archiver.kernel.org>; Mon, 17 Nov 2025 12:45:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t2GIxjzEPgQtngG3qU0WnH6UZPnhzUOgfRwXYNTAgcQ=; b=idizBpJfLuD7n4enAsSG7qUexK
	kXU2j1kL5eRO7jaPJQyJbo5C8uKhb7+/oZk7SJB/SElRl4Z8BYRxLLzsE0jGbgkv9G2O0DUZ7O11o
	Qoy73o5EFMjQzR2FDoLd1/WwdF5S6Lrsc8u5dFfowWu3Kz/7cRlzJcDNCUJQTUprznMQIljFWjdUJ
	OMEix4e52ywunhXsnItEgUCzdfa7dExOhItdzzX2/JSP90aJaaSo9T1ej4dJoSypMhL4qhhc+EYQK
	WUXIUZI2jV9egPiEpGQtpT0dJVEDWBw8lGoiBG+HPfpu6xchh4Y6tSlcgiKtfE9vyvAi9hHtVwYi3
	lXAFkAqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKyc2-0000000G7Fl-3o3i;
	Mon, 17 Nov 2025 12:45:42 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKybu-0000000G7Ap-2uil
	for ath12k@lists.infradead.org;
	Mon, 17 Nov 2025 12:45:36 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AHB2Kv53916356
	for <ath12k@lists.infradead.org>; Mon, 17 Nov 2025 12:45:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	t2GIxjzEPgQtngG3qU0WnH6UZPnhzUOgfRwXYNTAgcQ=; b=b5Zq0zE+HoTRx7U8
	Ga+WXsu9BEEPjmBusOHFWVBmLXW3BSW2uw44nr843afrfN0mxsII8nzAxMSHI8oj
	ehx9lkwRw9jkh76b6Rwv//xgQ2mUlKwv9QOyBGpjujC11LtgBxZGaU1cSa8y4tsu
	1KNilYP/9ar1T6dWQGjrJzCQxD0FtYLLFtP6gH636kKbOse+v75RgmngtrxDBBIQ
	ROu72b34H5K26MWZqPnsauXscNBxnU57ApIF+EQWZRFkAmee94RhzsFbfizJT/zB
	ItN0d2Zlc7VVbgDpaVY7Y+lB5vkrAkIqL5gMl81YrkjTouxvRyHqOST27MCpjjIm
	hqlIMA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ag2fx89h0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 17 Nov 2025 12:45:32 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-7b96038aa68so4486951b3a.0
        for <ath12k@lists.infradead.org>; Mon, 17 Nov 2025 04:45:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763383532; x=1763988332; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=t2GIxjzEPgQtngG3qU0WnH6UZPnhzUOgfRwXYNTAgcQ=;
        b=hWh/BrqPE1uKAvfX/4WlQxombdZjzsjuvXAFCE1ugNpCp6+C2UL91t1qWBP8gYmB7A
         IvOHxXNMOuiUewRZiK4BrbjXGzkcPR4M51bIJsYZYpPdQsJ6Nv9U04YxcUIQYkk5exm7
         gJhUY5m3HJAzvXUsgmpvHNxq/vphNhp1MCMRN4WvHrl/0q6TU/PeSFDnrWe+G7bWpsxK
         XklIRTmhlF3nR09KyACBdbd3mol08XQ/lV538BoVztzsJLmqscJzc8IRZsbcoXi+xruD
         1RVVyYjGdy4Lwm8urJJQteIm9UvMpeXbUJWvnm4dzEuqQpFXcOAqk67v9X0JV6vLm4ss
         QEpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763383532; x=1763988332;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=t2GIxjzEPgQtngG3qU0WnH6UZPnhzUOgfRwXYNTAgcQ=;
        b=vwAcdjlElOkyw48oJm+0inT4IjbUAkPSJ/IcJDeMKgpegxhzFVboMST0i/WoG7VqFG
         a8EG7UWC1z0uRInS4R9PLUyqUhkvjo/S3zVnkSMm8eRUkyMD5YP9K2yFN2UQ9XP/8OMr
         suqUEl8gGAOmjIgqIlvFp/zJRzESsJxJCB3rJHQ+T6SAhdrG6XfCuU39A0IJhWxCj6kT
         lXI2W874goo2CcwTEFZvSdfV5mqBGt/lOpwvlvPa8Zhc1V1qGcUbw7PLaIFkOSajgogi
         sEfl9tEFfvbSq49mpmzIfHrruwuCHXU7pMH7Z10Sm7oZy+1JUU0qKrpc+huomKnzq7jV
         OG/w==
X-Forwarded-Encrypted: i=1; AJvYcCVRENapBrm0hoRUHwgD1LObgkT2VB5pfvh8Wp9vZPFVYrWq84l7P/dHWBZLUmclmICtr2sAE4o=@lists.infradead.org
X-Gm-Message-State: AOJu0YxforLmbMEA2C1oBezz+zXn8MltYb4DgDfd69RFahJikg4m6c46
	k2QExpwcwya6bwxOEDJ5S4x7hqzpaunAfVQ2ntBdANn7Onc+yDm7hDyXPZtXSZA/Vj1dHGsmgE8
	SjGf9L7Y+BDW9x7YFqTHvruQnzTHfBZcmmL0gxF5oBX8lBgRigQyDZn7kRwTXxfKZ
X-Gm-Gg: ASbGnct+lhsZfMIo+eSDAMHcnxKtjaYlIsO7KB/ox4kDPOO/eyeUSy1CfX/eWB/Y8Ax
	W+AxzxshrqsroVNXGVeTo4n380OFIpO86JFqiEkEI0PDSoNyIr0OP+bILmagnKt9dfxIUhHBY1v
	4q9565eq0DcpvYxSOa/LAXTS655ez+cQSlo/niPoBnJKwCYFWgItooNdz8dIYMlY8Gf9KkPsMcT
	DlV8mF14vljo0I9PrhOI+SCewHG6zhQzM5l+rfnRW80Fb/T8tXrzifimHy6i0ULR/PWM7htfu+A
	pr9JDk+bak5sprZltuuSv4nx4WHN0yFLhsAJJZG6pDew7TIp1Vrd/gkf50JZGxHPXyh8iM/wHLM
	vIg8/Nwh9luq/
X-Received: by 2002:a05:6a00:148a:b0:7a9:7887:f0fa with SMTP id d2e1a72fcca58-7ba323d6167mr15472539b3a.1.1763383531501;
        Mon, 17 Nov 2025 04:45:31 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGDJbvN6jOsObid0beCDZHvRVXCcF/Syx9OjNHftPL31GJDCaNOSy040plNENpYw9lQsUyY0w==
X-Received: by 2002:a05:6a00:148a:b0:7a9:7887:f0fa with SMTP id d2e1a72fcca58-7ba323d6167mr15472502b3a.1.1763383531025;
        Mon, 17 Nov 2025 04:45:31 -0800 (PST)
Received: from work ([120.60.57.34])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b927c23103sm12814553b3a.65.2025.11.17.04.45.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Nov 2025 04:45:30 -0800 (PST)
Date: Mon, 17 Nov 2025 18:15:20 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
To: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Cc: Jeff Johnson <jjohnson@kernel.org>,
        Johannes Berg <johannes@sipsolutions.net>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-wireless@vger.kernel.org,
        linux-kernel@vger.kernel.org, ath10k@lists.infradead.org,
        ath11k@lists.infradead.org, devicetree@vger.kernel.org,
        ath12k@lists.infradead.org,
        Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
Subject: Re: [PATCH 0/2] wifi: ath: Use static calibration variant table for
 devicetree platforms
Message-ID: <exfmj52dqu3uctwsb2gopcjg7744vq5avlkahtmgfw4opw4mfl@t2svrln72u53>
References: <20251114-ath-variant-tbl-v1-0-a9adfc49e3f3@oss.qualcomm.com>
 <2fd84ab2-2e3e-4d05-add5-17930a35fedf@oss.qualcomm.com>
 <jnggqxqv3rjzhyevovnnxzplfhl3t6auhhvmoz7wxmsf6awgdx@dusdgxwsxvts>
 <b8277024-f9d4-4f17-946f-c2c390669067@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b8277024-f9d4-4f17-946f-c2c390669067@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: 9gZgwGjIBBtYI4uGSSRskdzyHBX4UU2Z
X-Authority-Analysis: v=2.4 cv=EIELElZC c=1 sm=1 tr=0 ts=691b18ed cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=SvArCPxluHhT4bP621h3eQ==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=W1PEZSGAYdG1hK9pKucA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
 a=HhbK4dLum7pmb74im6QT:22
X-Proofpoint-GUID: 9gZgwGjIBBtYI4uGSSRskdzyHBX4UU2Z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE3MDEwOCBTYWx0ZWRfX3WTLv3r1p04I
 24YFeEJL4+8pEgX5Q3h815AVwdDTfsRIDFVltr/kjU7hqK/3L+iQa9VuUJ3yXMGVlcjDRD4Dbw5
 grHi3K1Xqw6tftuKpn0z9Xib4Qho11ZJ3Dz/xk7DcctSEKfzNfKV7KtRE8g77RfJu/lIuj2rmt0
 xZJeBXglLcw7nZxYe2BcLVJRZhO4kDNGKrZFs4nHHOyo058iif0QMhLm+19LHkjOr88HG1c/P/P
 qwL4J3gZ58ItIm7xNuphRKdR6Tkw7901BD+IBfQAWk0aKQpRstU+q4gzhZV8AhE0exOapCBhmVF
 2kU722w/rknTxkq7Uzjk0iUoCh+OowzpWn5yh5zinUe8rkmmfV1rtcgguTRJn+7nKtkG4YxM3UI
 Awb4Q64S/lpYJfpCpamgnpvRiWIvDw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_03,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 bulkscore=0 clxscore=1015
 lowpriorityscore=0 phishscore=0 impostorscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511170108
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_044534_844182_2950F02A 
X-CRM114-Status: GOOD (  40.90  )
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

On Mon, Nov 17, 2025 at 05:40:06PM +0800, Baochen Qiang wrote:
> 
> 
> On 11/17/2025 5:00 PM, Manivannan Sadhasivam wrote:
> > On Mon, Nov 17, 2025 at 10:36:39AM +0800, Baochen Qiang wrote:
> >>
> >>
> >> On 11/14/2025 6:22 PM, Manivannan Sadhasivam wrote:
> >>> Hi,
> >>>
> >>> This series aims to deprecate the usage of "qcom,*calibration-variant"
> >>> devicetree property to select the calibration variant for the WLAN devices. This
> >>> is necessary for WLAN devices connected using PCI bus, as hardcoding the device
> >>> specific information in PCI devicetree node causes the node to be updated every
> >>> time when a new device variant is attached to the PCI slot. This approach is not
> >>> scalable and causes bad user experience.
> >>
> >> I am not very clear about the problem here: is calibration variant device/module specific,
> >> or platform specific? If it is module specific, why the lookup is based on the machine
> >> 'model' property? While if it is platform specific, why do we need to update devicetree
> >> node whenever a new device is attached?
> >>
> > 
> > I think I mixed the usecase of the 'firmware-name' property in the above
> > description.
> > 
> > But nevertheless, the calibration info platform specific, and hardcoding the DT
> > property fixes the location of the WLAN card with a specific slot. For instance,
> > if the board has a couple of M.2 slots, users should be free to plug the WLAN in
> > any slot, not just a single slot where the property was defined in DT.
> > 
> > Also, if the users plug-in the WLAN card of another vendor, not Qcom, this
> > property is irrelevant/wrong.
> > 
> > PCIe slots should be plug and play i.e., users should plug-in any M.2 card and
> > expect it to work.
> > 
> 
> correct
> 
> > However, as I learned from Jeff, calibration variant property is also going to
> > be required in cases like router boards where each slot is dedicated to a fixed
> > band and the calibration variant is going to be different for each band for the
> > platform. So unlike I thought, this DT property cannot be deprecated. But going
> > forward, I'd like it to be used only in these special usecases. Most of the
> > upstream DTS have a single calibration variant for the platform and for those
> > generic usecases, this static table should be used.
> 
> If that property is not going to be deprecated, should it take precedence?
> 

If you mean 'it' by this static table, yes, it is going to take precedence as it
should cover the generic usecases. For special cases like the multi-band
routers, existing DT node fallback will cover.

- Mani

> > 
> > - Mani
> > 
> >>>
> >>> So to avoid relying on the "qcom,*calibration-variant" property, this series
> >>> introduces a new static calibration variant table based lookup. The newly
> >>> introduced helper, ath_get_calib_variant() will parse the model name from
> >>> devicetree and use it to do the variant lookup during runtime. The
> >>> ath_calib_variant_table[] will hold all the model and calibration variant
> >>> entries for the supported devices.
> >>>
> >>> Going forward, new entries will be added to this table to support calibration
> >>> variants.
> >>>
> >>> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> >>> ---
> >>> Manivannan Sadhasivam (2):
> >>>       wifi: ath: Use static calibration variant table for devicetree platforms
> >>>       dt-bindings: wireless: ath: Deprecate 'qcom,calibration-variant' property
> >>>
> >>>  .../bindings/net/wireless/qcom,ath10k.yaml         |  1 +
> >>>  .../bindings/net/wireless/qcom,ath11k-pci.yaml     |  3 +-
> >>>  .../bindings/net/wireless/qcom,ath11k.yaml         |  1 +
> >>>  .../bindings/net/wireless/qcom,ath12k-wsi.yaml     |  6 +-
> >>>  .../bindings/net/wireless/qcom,ipq5332-wifi.yaml   |  2 +-
> >>>  drivers/net/wireless/ath/ath.h                     | 98 ++++++++++++++++++++++
> >>>  drivers/net/wireless/ath/ath10k/core.c             |  5 ++
> >>>  drivers/net/wireless/ath/ath11k/core.c             |  7 ++
> >>>  8 files changed, 115 insertions(+), 8 deletions(-)
> >>> ---
> >>> base-commit: 3a8660878839faadb4f1a6dd72c3179c1df56787
> >>> change-id: 20251114-ath-variant-tbl-22865456a527
> >>>
> >>> Best regards,
> >>
> > 

-- 
மணிவண்ணன் சதாசிவம்

