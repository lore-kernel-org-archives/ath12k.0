Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 334C7CEACEF
	for <ath12k@archiver.kernel.org>; Mon, 17 Nov 2025 09:00:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CMa3FaiLndPXvuaXrzGyx7LakP9bFvznqBwHaYNcbYo=; b=nP1/UqOgHZyp4yBDm7tr8SzGIG
	F6hoF0tTz+8r0+jWUQkzzESDQlbwLpm+99yhIXHEtLUIa1lffULAXWnR/UowDJmj8IF7/NgADSwuA
	W3ZtL67S3ImLfe12BLpaIuuW/NUkMUFGsJmTjSac1HSfYSToW0KgQhN3jEdK5vQS/dK6b4AXORspp
	diSJKIGGDryJ/2R+yxI3u0Ctx7yBliovrSQq9Sp+OBjPNmu4xlLHPGOjaC1bYWoSBXW9ujhMLSpz4
	XMHHsyqshJ//4+Lns1dA7DSOVV0V8PboJr+TFd2lmBgDF2DzfFU0Z03yGm9+aFL7YXUT4GSWmxuIN
	yyDk7TRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKv6T-0000000FjDH-3YHa;
	Mon, 17 Nov 2025 09:00:53 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKv6R-0000000FjCE-3dEX
	for ath12k@lists.infradead.org;
	Mon, 17 Nov 2025 09:00:53 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AH4npgL2851535
	for <ath12k@lists.infradead.org>; Mon, 17 Nov 2025 09:00:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CMa3FaiLndPXvuaXrzGyx7LakP9bFvznqBwHaYNcbYo=; b=CPBjihyMHTLRrjQj
	4XHfLEacuQ6JFr9+VGc+ghla7bsIHF6CYow/WPU8FRlxZlnQO2UmfTzhvNaV7nMn
	tDGsGr8GNsv3hOYWh42aGdAEgn3sWBrkGmXxvtaNdqRdz95eegbbXiVUKnQbmwG4
	S48llXoTy0zMk3WO/C/foDUaJ7d5OI/xHKOummpHT6x/C/Zr7HZKqt9FpP7IYfHv
	YNT7/X2KTu0N8XJ0jn+IrCe0JLZ7NDzWluP+Pyr8eQVqbmfzlQhwN52iLtj1PKcA
	zTAeWGWu/wKvuK4sArEOzHmndMLq2HCZF2kQlsoHNn/kcVe2yxwkcSGKZ7eWi4xS
	BepaxQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aejh0byxx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 17 Nov 2025 09:00:50 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-297f8a2ba9eso111557575ad.3
        for <ath12k@lists.infradead.org>; Mon, 17 Nov 2025 01:00:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763370050; x=1763974850; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CMa3FaiLndPXvuaXrzGyx7LakP9bFvznqBwHaYNcbYo=;
        b=P9gnQVUK88UlJGMuMaGz1k4rIxyUvkQ5xe3ux9jkIFm2C6XdNfonkls+8uh7DOGJea
         q/vlYne4SJBOOvAlabr1jYzHIoozxlhwXIT/c3KJPg93iKMty0nAX9jl7TGUBBfrksoA
         uLywkgbo7jlF6HEf9CjVVasEInyjJATK0TD9snUHSZO10zGwz0hK7rWDFJMNwJ8Vh6FU
         ELtzc2PT6Y2hr0jWYP8x88Z1HRsrO8T/IVSkdVi6z+MtP3HDk2hH24qPF0TbkcQFMaGZ
         bSCncnxEL/OGbVLwQMAcpsTZbwx6o+vb2HonTgM1NTNs0HGc6dXMN4ONN88x7pDlUE9P
         diAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763370050; x=1763974850;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CMa3FaiLndPXvuaXrzGyx7LakP9bFvznqBwHaYNcbYo=;
        b=px0bGGbtcBsUJ1UULY1uKFIQ5V8QHfDvVCkET3VagfFzUov6G+2v6noehBNNE7lqTm
         fCGWTf39E7QvcuNccmP2eMRlgLDZexU8xISV+bvyak1lUCO77jYspXwewZOvrrbj0Bjc
         5VA+pyUm8nK9boKgir4nsEbSuvNOu7eUr8INaYGu7oj8tIRNwbeVHw3NWm/mbeCeAxp5
         hpYfVMBn729lCk0x2nnVt8xPnyENCB+cs94pf3ZTrvinAzEn2RotR9sV06S0LeBJUHBk
         3TusIxBC99Rl+5eQ6xlXXEiABvg5ZzO5QY8cDKKuDuQ7yBaiDqGBTUSPVdW0bf1hhqLo
         PpkQ==
X-Forwarded-Encrypted: i=1; AJvYcCVFiNbgRn8dWwtxvyThwJqdgoHYYMBf6uJL6yXsMcEOuONUpLuoMnI4/Rx+nmP970CNvkvSlDk=@lists.infradead.org
X-Gm-Message-State: AOJu0YwWxabGlmCjPn8bY3+3MTH4C1k66D6U5bOusRjr0qazigBIZQrG
	XRUhw7DVHwtome4Hy4RQCk7YdNUtBnEJHCrsgORxIAAWR90N445axICz+Xh9sK83ZusdZnrlkkI
	+DV8pdp7hQEa3g0XNbEtGNNccw9AU5d4qk1yNTkyTPpfJB0+Y4vSLuF8w4QZyrw/D
X-Gm-Gg: ASbGncshH0qLduaPTsleBdxBy3HGSmJjs0qZhnCDf6UFyQnLuYjiZToqOL7FyW8LnI0
	M588AogRA2fTKWZgZOwVstdXDA3MyDVm0miR37dr2EzhScETqD1+IZ98iOHyHrJhUVqYTkN7Fnp
	ALnK6Ig8KzGYgQvrYH8DtG1cxkPgyTYq51p986iMfyikoE9QfaA1SiD55PUtotQ8GeKffvfi+0b
	oEbUsr3XZtRCt+4IpPx0xOhQTvAfvql8jYR/Tsld8lHwqprtBIts34UOYyMeRuNq6jHwA0vIN+U
	9izvxfIZV22iA66eQsjCIjb5CmqF3/foJAvpKUGbHPAmxf4OIXz/kizSwA96eAKAHvCkhrzD1DT
	MqerSkEo6ySYa
X-Received: by 2002:a17:902:e1c5:b0:298:3545:81e2 with SMTP id d9443c01a7336-2986a6bfa2dmr88167995ad.22.1763370050063;
        Mon, 17 Nov 2025 01:00:50 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFnrNdIz6rZtkHkqRUVqdF32sENFrtojZo1qL47E8dcBWurjeZGz/LHdZ+VRed2ABXDGYua7w==
X-Received: by 2002:a17:902:e1c5:b0:298:3545:81e2 with SMTP id d9443c01a7336-2986a6bfa2dmr88167425ad.22.1763370049309;
        Mon, 17 Nov 2025 01:00:49 -0800 (PST)
Received: from work ([120.60.57.34])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c2beb34sm132716465ad.76.2025.11.17.01.00.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Nov 2025 01:00:48 -0800 (PST)
Date: Mon, 17 Nov 2025 14:30:40 +0530
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
Message-ID: <jnggqxqv3rjzhyevovnnxzplfhl3t6auhhvmoz7wxmsf6awgdx@dusdgxwsxvts>
References: <20251114-ath-variant-tbl-v1-0-a9adfc49e3f3@oss.qualcomm.com>
 <2fd84ab2-2e3e-4d05-add5-17930a35fedf@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2fd84ab2-2e3e-4d05-add5-17930a35fedf@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: w-6ejftFYcgLem69K6rX2fOckeE3r6W-
X-Authority-Analysis: v=2.4 cv=A8lh/qWG c=1 sm=1 tr=0 ts=691ae442 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=SvArCPxluHhT4bP621h3eQ==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=rZNuoRbQ_TWyfwDSFJ8A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
 a=HhbK4dLum7pmb74im6QT:22
X-Proofpoint-GUID: w-6ejftFYcgLem69K6rX2fOckeE3r6W-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE3MDA3NSBTYWx0ZWRfX2Hw92xUpM3WQ
 bBZNhlXqd3Ilj4ybJqBqDmKS93iMbXGub5vVkuw7JKyz71iVD2eT13hXowXG6QXKu2KwSBnhCZk
 5c2LJiPwxgvgRQ21rSkIzG3eJwaha8L9AGNsp9wgtYZi/r2GxmbY/4lChWJgwWf28+bpoK7CJEC
 JmAI1ui+O6rv7PWYPpez2N3vdleq9B/SvCNmWUk7YYtidCHvrBTrBjy4kxDsd4qygBDSyHP15vj
 MOLeyGKzT2FOyeHPqt8fG2/uyhkeVmw0NpasanBmO0iC2QHSlctHRDMXI2WrhAx3onTkbIj9Olp
 uP2MXfzwNSeJlLPaEjS2xevwqEHtB5/A3LAAWVdE9GulnWCMmGZxNu4YWEGAeakiYy+muXAfTIu
 wYc0B9vgYSjBSPbgkvmSuQCpM3HfJg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_02,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0 bulkscore=0
 adultscore=0 malwarescore=0 priorityscore=1501 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511170075
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_010051_973790_2C652335 
X-CRM114-Status: GOOD (  34.02  )
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

On Mon, Nov 17, 2025 at 10:36:39AM +0800, Baochen Qiang wrote:
> 
> 
> On 11/14/2025 6:22 PM, Manivannan Sadhasivam wrote:
> > Hi,
> > 
> > This series aims to deprecate the usage of "qcom,*calibration-variant"
> > devicetree property to select the calibration variant for the WLAN devices. This
> > is necessary for WLAN devices connected using PCI bus, as hardcoding the device
> > specific information in PCI devicetree node causes the node to be updated every
> > time when a new device variant is attached to the PCI slot. This approach is not
> > scalable and causes bad user experience.
> 
> I am not very clear about the problem here: is calibration variant device/module specific,
> or platform specific? If it is module specific, why the lookup is based on the machine
> 'model' property? While if it is platform specific, why do we need to update devicetree
> node whenever a new device is attached?
> 

I think I mixed the usecase of the 'firmware-name' property in the above
description.

But nevertheless, the calibration info platform specific, and hardcoding the DT
property fixes the location of the WLAN card with a specific slot. For instance,
if the board has a couple of M.2 slots, users should be free to plug the WLAN in
any slot, not just a single slot where the property was defined in DT.

Also, if the users plug-in the WLAN card of another vendor, not Qcom, this
property is irrelevant/wrong.

PCIe slots should be plug and play i.e., users should plug-in any M.2 card and
expect it to work.

However, as I learned from Jeff, calibration variant property is also going to
be required in cases like router boards where each slot is dedicated to a fixed
band and the calibration variant is going to be different for each band for the
platform. So unlike I thought, this DT property cannot be deprecated. But going
forward, I'd like it to be used only in these special usecases. Most of the
upstream DTS have a single calibration variant for the platform and for those
generic usecases, this static table should be used.

- Mani

> > 
> > So to avoid relying on the "qcom,*calibration-variant" property, this series
> > introduces a new static calibration variant table based lookup. The newly
> > introduced helper, ath_get_calib_variant() will parse the model name from
> > devicetree and use it to do the variant lookup during runtime. The
> > ath_calib_variant_table[] will hold all the model and calibration variant
> > entries for the supported devices.
> > 
> > Going forward, new entries will be added to this table to support calibration
> > variants.
> > 
> > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> > ---
> > Manivannan Sadhasivam (2):
> >       wifi: ath: Use static calibration variant table for devicetree platforms
> >       dt-bindings: wireless: ath: Deprecate 'qcom,calibration-variant' property
> > 
> >  .../bindings/net/wireless/qcom,ath10k.yaml         |  1 +
> >  .../bindings/net/wireless/qcom,ath11k-pci.yaml     |  3 +-
> >  .../bindings/net/wireless/qcom,ath11k.yaml         |  1 +
> >  .../bindings/net/wireless/qcom,ath12k-wsi.yaml     |  6 +-
> >  .../bindings/net/wireless/qcom,ipq5332-wifi.yaml   |  2 +-
> >  drivers/net/wireless/ath/ath.h                     | 98 ++++++++++++++++++++++
> >  drivers/net/wireless/ath/ath10k/core.c             |  5 ++
> >  drivers/net/wireless/ath/ath11k/core.c             |  7 ++
> >  8 files changed, 115 insertions(+), 8 deletions(-)
> > ---
> > base-commit: 3a8660878839faadb4f1a6dd72c3179c1df56787
> > change-id: 20251114-ath-variant-tbl-22865456a527
> > 
> > Best regards,
> 

-- 
மணிவண்ணன் சதாசிவம்

