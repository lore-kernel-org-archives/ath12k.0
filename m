Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DABD8CE7AAE
	for <ath12k@archiver.kernel.org>; Fri, 14 Nov 2025 11:02:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2RR1QJ03Mswmjs+cujBHJS7vnuUVaPQ+K3SVtWWyBPQ=; b=xzBWW7K6kjnRcEu4VT4Ygkj5gN
	rTvpjif/Fje+rYogTInVLKWofTQKg1r4gFm+iSnGxoeVJb5x0YHIBvXUoE4Iub/UDzrMwQ9ELFf2U
	70i7aqRrbYzm/FG25DnxYFZTZA7MjoSKy9R+ad7bSJyw467Gg+978kyvkSyKq7MyXzCcxUmEhBS7c
	ZMgElQfy6TImJbBprE/yv+AoLLLLSRnpdwhO+ktzOPaJtqOg4z8mMvZIJUGwL5KtSD/xEsT/c7Itu
	ENdgswVLoLQU/LpACYaQPc0/fse33uml8qbEZgRaos98BY0WRF9jsAYjs8epeTPm3cQ3Tf3A00i6F
	8Yyr3vkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJrZZ-0000000C54R-2iz3;
	Fri, 14 Nov 2025 11:02:33 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJrZW-0000000C53B-1wrM
	for ath12k@lists.infradead.org;
	Fri, 14 Nov 2025 11:02:32 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AE8agAV1488258
	for <ath12k@lists.infradead.org>; Fri, 14 Nov 2025 11:02:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2RR1QJ03Mswmjs+cujBHJS7vnuUVaPQ+K3SVtWWyBPQ=; b=XjjCXc00U1MwFPzf
	8bPPHsWCyQ5uSogsh0zSw2ThKZS76fCn40FGGtJeALNAAYSSKj76lMBJC8u0q952
	5lL3OLSXFGOL6PacJrFI/3RhHasEqtwf6BwHOxPZzcQwyQp6XdTayZ80M0SOwKQU
	vCnLXlZDysKwxYP/xXcuRc3dH6/cjt0Vg15aZyjNEdy0XH4tzDN9Mr+Ftr1FoYnU
	28onChHHLXvVZtjto2OITSKMb74IIeW/8vvtrbKh0xNHC/ehu9c8PUM3yCkUDZTR
	fY1tINRlIjG3VF7IcK4jLY9t6IciF5bqyyxorzMqqt734aFRE35i583bJgpOSGG2
	S4e/Zw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4adr9hsw90-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 14 Nov 2025 11:02:29 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-7b991765fb5so2410769b3a.1
        for <ath12k@lists.infradead.org>; Fri, 14 Nov 2025 03:02:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763118148; x=1763722948; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2RR1QJ03Mswmjs+cujBHJS7vnuUVaPQ+K3SVtWWyBPQ=;
        b=gjx0EfpTZueEcVMsAIpbA19SqRqn1Q7PIUwASNZs8udY9UxxnvLzZae+9hZR7llaEn
         FhbRQf+kbuuZwavDZhPP5330IMK4yV5BjD/MRU+Yn7sNw2KjRqeVDKs+l3Gskmnle4+3
         BGvLsKxRX5NX/Kg53bxlu8RwDTKpEW4Hx06Vr3Z6hxAodBlVbW0VMq2YlodBzejzdCIr
         aP8dESado24s0H9pUgW7RXSHfJVdbxJpopVsIWiHzGP7OEooavBGw+edaWy0jxtSS4Gq
         nAjsapqtEDLmCysuBH9Bp/noFBwnS7LW0nQuRllwtlJRwKImXaxHDT1XSEREPvP90+p/
         bH4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763118148; x=1763722948;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2RR1QJ03Mswmjs+cujBHJS7vnuUVaPQ+K3SVtWWyBPQ=;
        b=l8gAmxtrZmBS3HhhwwcQyYV3ksXJ7c/04JvyL/7j82jkptplYGP14k0NDy0xKgNbJA
         4DhFN2Evq3mdUpl7BtE2iOi9iZceYlRd7lJ4si9bYxX4fXx7TfS2brNuFa+DDzYz8Btf
         mfunlR3+cG4OvWfhn6foa0mkbO7iXt9QDLidEjwApTaoDbaN/heJTZhGEBUGUPMDyVJw
         QuMZm1WxWr81rEs5TdEo7U8twiZI2HZ6jn8V7xd1RxOyC4b/bO435Wb45udzVE3uBrav
         FfqUM0owM8iGzsYfHodZ9xg6aIM3oyhfBbdCOVYh9Hm86jWBwQwqbtRGgvk3SDSPEHKQ
         7UVQ==
X-Forwarded-Encrypted: i=1; AJvYcCWuwcwoxVIWJMy+6xklPEGGbyG3s4AQg4uH5MOUr2WtEie3dk3wcQUGAcjNR0bqIXYhQF+B/jU=@lists.infradead.org
X-Gm-Message-State: AOJu0Yzr2c2JcGKYNZ6gNER9T1YV3s2rN5ULed3a+B0LG3t+UoT9xNsS
	djsoCF9qudPEK4q/HiqsHHc8ZXjqgKR1Lro0XdLc0TBQbk3VkK0VD2flPGLQfw5wetsBxOp/wO7
	HY4j6d7sMJpicj4qIFD00I5w9JFLTkB08JRR4Cv2BgTa1rqZnGw0ciMM/RvRdhr6b
X-Gm-Gg: ASbGncvaLOpaoyxvWsmhJdt1MdwA0tC8pwPJg9tB82R38Po+5R6YCJ6aYUUsP30Pe6P
	ReW0EC7XR+1wdHhakHCqJmRp9Ruqf9n3XvayOnRKkccXg1uGRZ63D4Uql7oXKZKqw5jYG2sOUsh
	T05xfLVxWmLbZ++yDPaPwhzLjQeEGDxc8oZFbDpXMa7qc2UGwpbrFOSfzDMrq++MOql85neoK4d
	hVKnuviJ0udP7V7cSAiqmnGotqJCWWRKnpgC0cz8Pk6Vg7eapOvNrU5+j2h4i3UdQWKWaOaPC/y
	+sqOtUplQ/9rDIVSx5CoayAA6PU6TGZ3aM+5zCdxC+VnPPf5srpVgt/dAtCz8+K38tBnUMtKHTb
	AS0T61KdEOiVxiY8=
X-Received: by 2002:a05:6a00:198d:b0:7b8:9d86:6d44 with SMTP id d2e1a72fcca58-7ba3a0be249mr3281997b3a.9.1763118148337;
        Fri, 14 Nov 2025 03:02:28 -0800 (PST)
X-Google-Smtp-Source: AGHT+IExFNYt2MskO3W88XzfwFL4ANOFXf0FsrBkggPFobNWhKgZWFcTDPQBJLVYzM5f0k3sKC8ZFQ==
X-Received: by 2002:a05:6a00:198d:b0:7b8:9d86:6d44 with SMTP id d2e1a72fcca58-7ba3a0be249mr3281959b3a.9.1763118147841;
        Fri, 14 Nov 2025 03:02:27 -0800 (PST)
Received: from work ([117.213.102.44])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b9256b8824sm4884070b3a.31.2025.11.14.03.02.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Nov 2025 03:02:27 -0800 (PST)
Date: Fri, 14 Nov 2025 16:32:15 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Jeff Johnson <jjohnson@kernel.org>,
        Johannes Berg <johannes@sipsolutions.net>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-wireless@vger.kernel.org,
        linux-kernel@vger.kernel.org, ath10k@lists.infradead.org,
        ath11k@lists.infradead.org, devicetree@vger.kernel.org,
        ath12k@lists.infradead.org,
        Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
Subject: Re: [PATCH 2/2] dt-bindings: wireless: ath: Deprecate
 'qcom,calibration-variant' property
Message-ID: <fmumja63j3xvbvfxlmtnkfubgw4jwo5f43srrpfgqrxyqknrj4@izsqazgbiehp>
References: <20251114-ath-variant-tbl-v1-0-a9adfc49e3f3@oss.qualcomm.com>
 <20251114-ath-variant-tbl-v1-2-a9adfc49e3f3@oss.qualcomm.com>
 <b9b4f1bb-45ef-404e-b75e-962e85a557a2@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b9b4f1bb-45ef-404e-b75e-962e85a557a2@kernel.org>
X-Proofpoint-GUID: uIez3hemhwpsDbrIlmrapVlFKLHS76r7
X-Proofpoint-ORIG-GUID: uIez3hemhwpsDbrIlmrapVlFKLHS76r7
X-Authority-Analysis: v=2.4 cv=N+Qk1m9B c=1 sm=1 tr=0 ts=69170c45 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=Nd/jlyMbCgud2ZEcqXkYLA==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=iIcxu6EjtSR0Qi8y410A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE0MDA4NyBTYWx0ZWRfX6YIvI2iKxgXC
 IbgWpWoz6d2c3Y8WfdUvqyKD4WdzuY+ikUaoMpRk3qiTOfyTCHQgGUaVDl9qD/IEbi1XpRjMyzb
 OBY3EaNh3odkFhThe6+oGS02560zp7pUQXMB+9N6XUvDsEndH4515W4KkNhtaPLaxwDMSxwBfRk
 lkhRJKUxqB4o6+PMXZoG+9tiS8zN+6WkAUnYSctR/YrXiOn82u72PuCsjd0rYvXeFIdR2t5aPyz
 VyqTyjwk4kFe65KdKqdTNGJDRnWpElE4dxJUuhcEikQpICIchz/t33bMpuRBUhKfNmttohZChTo
 vygwIwKR7YZT3zSvB/qpX9hX5annXbLoKIjyNQuheiatTPkk5eNP6avg3KEA4lv7BOidpI2i0ds
 p9zRGO+qDI8NGrdlbXtMlg/iFoh6Tg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-14_03,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 spamscore=0 suspectscore=0 impostorscore=0
 clxscore=1015 malwarescore=0 bulkscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511140087
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_030231_145117_E567D0CB 
X-CRM114-Status: GOOD (  22.28  )
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

On Fri, Nov 14, 2025 at 11:47:25AM +0100, Krzysztof Kozlowski wrote:
> On 14/11/2025 11:22, Manivannan Sadhasivam wrote:
> > On devicetree platforms, ath{10k/11k} drivers rely on the presence of the
> > 'qcom,calibration-variant' property to select the correct calibration data
> > for device variants with colliding IDs.
> > 
> > But this property based selection has its own downside that it needs to be
> > added to the devicetree node of the WLAN device, especially for PCI based
> > devices. Currently, the users/vendors are forced to hardcode this property
> > in the PCI device node. If a different device need to be attached to the
> > slot, then the devicetree node also has to be changed. This approach is not
> > scalable and creates a bad user experience.
> > 
> > So deprecate this property from WLAN devicetree nodes and let the drivers
> > do the devicetree model based calibration variant lookup using a static
> > table.
> > 
> > This also warrants removing the property from examples in the binding.
> > 
> > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> > ---
> 
> The problem - visible in one of the examples here - is that one board
> has multiple WiFi chips and they use different calibration-variant
> properties. How do you find the right calibration variant for such case
> based on board machine match?
> 

I suspect the legitimacy of the example here. I don't understand how a single
machine can have same devices with 3 different calibration data.

AFAIU, calibration data is specific to the platform design. And I don't see any
upstream supported devicetree having similar properties.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

