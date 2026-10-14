Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9B88CC6B1D
	for <ath12k@archiver.kernel.org>; Wed, 14 Oct 2026 14:06:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pVpqOXgKn0VsPxuA6dqYU8O/g3ed5Mas2OnmRjlWtHM=; b=3kiF8sigS0Tq0b/NIirHnAiJwR
	ZmN4mdvjvq/G+sBVqd690RLFSSNUbJVXGaLIW7EMj2S0H72Qj+HvMlicvJortctUb8UGP/ZDQyv31
	KgIAjAgXrdB1s33OOtzifma6YCTfwlA//obVTNbKcnQRbZYwRPyeZ0zLbvTQAISRVHlMS8+jNvDzU
	+3Jl0HHdp43TlJyCLE32VYWJhN8D4cZahBmo5SH7iy5jWnfI1uusgYfkfDDBo4QzD4u/2zz4WfmRA
	w16UGuFJ5k0c/kuGSpYR6t9yYCBv2t02Ktj79386pw/HjFV3gvfliJqNzfoRFhX+CuEBnDuPGpDHt
	s+lJbn4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGzcR-0000000Fg3o-29ax;
	Wed, 14 Oct 2026 14:06:11 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGzcP-0000000Fg3F-0eYe
	for ath12k@lists.infradead.org;
	Wed, 14 Oct 2026 14:06:10 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69E9xsuT806654
	for <ath12k@lists.infradead.org>; Wed, 14 Oct 2026 14:06:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pVpqOXgKn0VsPxuA6dqYU8O/g3ed5Mas2OnmRjlWtHM=; b=nCe1EvZP/0aHf93I
	BdHU2vT98aD5USlH/P+wqwb22JSku1+uqNnuW6l3q9f2qtOUMjuDDyhS/AKwQ9f/
	YZsVsxjWmMn76m0UhAtPtVVw2OnpgqJrj86RhZrv3D1SsYGwuvAbIDXGTTIjU9aS
	6hIIK36//VRJj3FSeXCdrzcZgAjxwDYT4pQrKcalEL9FlbJYj3+WuAots4Hqm7PI
	m2KpLgQ81UN21xtv0MJ6aRUs4pP5ExZS5S/81C9CgovP1HKAtUzm4iqtzku+GXDc
	GyGD9QLmffNJ4wX82sO2ms12M2t34WgmqIhOLjMtPm5QGX2Rnjt3ImmytdLfFg4F
	ZV+MAw==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9ud6btna-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 14 Oct 2026 14:06:08 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5caeeb345c7so134504e0c.2
        for <ath12k@lists.infradead.org>; Wed, 14 Oct 2026 07:05:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791986745; x=1792591545; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pVpqOXgKn0VsPxuA6dqYU8O/g3ed5Mas2OnmRjlWtHM=;
        b=bhwpld4DyL3mcLpPCrPToItwU+sLyv1sZH7oMiutO24ntFOTwZReRItlnN7MQuvzSY
         nn0qqjLTsymoPl3xXlJ0/rHOCAbvbOR1XAz/ZvpDIWXHxL4s5PzmqWNM8UcKhg0RhyvC
         bxJTY0Hfagp/T6oN44Oh9z2kpHavfcZZOnGYIfGn4ljKkeJRPjjwtk6dPQqt7CC27rqF
         5ZbnfyKBOsC9jM4u+tTA8qmO7Xe5xJlNuEBf+rtK9KdCQymoMnOZO5v/dzc/n75bJf8b
         5EaOXAFTeTVOFyBvwv8zVtnlNNWsBBP8UowG1F/C25H/STZdZHTp1zfigq1W2OoOfJVi
         kETw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791986745; x=1792591545;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pVpqOXgKn0VsPxuA6dqYU8O/g3ed5Mas2OnmRjlWtHM=;
        b=OJm7mEvRkw3nFHBpwNjjn7tNSOZfIAUs8SCUl0ESTbqxYkRgYzqC/1xTbOu2LkuHR5
         3oIYKvj9BLOTKWRsW8hzGxdAPfLfGkDPU0O5N61vfx69t5TTQWlN3RCUO5mYPVuBX9Fi
         Tb74vv4xpm0lMU6sFQ/yJLWME05pF9UsHPE9WQEkyekjmHeKqEORLuX1Uc059YNiQPFM
         SrSL77Spqej47usXC43vPkkeiVVBzyMwSA/Es+tSbd1kPZ7cM6WvNbG/k90vnlIld4AL
         q03C5YyjtpqcyF7oB9HDHhF4W2BpjI10TmxY+ABpMcuIJBMCvYykKUuOHxBmgIhavgmP
         z5Mw==
X-Forwarded-Encrypted: i=1; AKwUvBwQD5tSjnq1qzfkO0KSDKNOW5su1v52HWul6akUJBUd7pJPqN8BGhbMwQ7WxgLv9Lea1EgCMuY=@lists.infradead.org
X-Gm-Message-State: AFq9FYKSaX5IMQmuhPbCzp1xKUgjx0ZMfNqV7LYqGhRnDa14ZGxaMSfB
	IvEL6gdZO45Kj4UzMLb+ISjGgw47g/hVga26GRRD8tThrOd7Qo5cTtpsTN6F3q5qnPOEb2GKvTZ
	H5awQzzrjd5K5tezgwS+8BIBx0GKeFaQKFMLypPYCzntqLe++o5+dRSeAqf8s9Wo9
X-Gm-Gg: AYBFou2w7GK6awWtrRlYTLNn337Qbf3YFaQWG1yf6JtXL+MyXMPsSyeLTO3WWdz/N4g
	O/YtxK1UqQwmU0FBN2a2P6a9VwijYyosLVCuIjpgsjIwFVV9oqfJGF0NMXwnFIOqHiv8ROT/ked
	sMsgyKUxTWuGxK0wcTmV5fUo0aEMMGZVOZh/NJVbmdcWENiOWqUNuYstgSIh9+j8IXGWD3Oo+el
	mXiYgfM1ne0oZgTxMxfKqaVAu6RxUTfHhj7+acmQ0+Elb6pZ+qI1D/sT/wA+4OSlfpAzPVhULRW
	DQrFxrQ0mBFDHRq8wOpoyJw+L41qoGK0kyp7cY3SM9o50KDkpawkxYBaLSi5VSI7vfBCHcfS8p1
	WIlzcfpBH0EBQtKMjPuhlzw==
X-Received: by 2002:a05:6122:4659:20b0:5c9:f6b0:e5e0 with SMTP id 71dfb90a1353d-5e91f45e3edmr3449588e0c.3.1791986744652;
        Wed, 14 Oct 2026 07:05:44 -0700 (PDT)
X-Received: by 2002:a05:6122:4659:20b0:5c9:f6b0:e5e0 with SMTP id 71dfb90a1353d-5e91f45e3edmr3449553e0c.3.1791986744082;
        Wed, 14 Oct 2026 07:05:44 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b203862c4esm1222206a12.16.2026.10.14.07.05.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Oct 2026 07:05:43 -0700 (PDT)
Message-ID: <d2ab26d1-2feb-4759-bdfa-7db9b923e7a6@oss.qualcomm.com>
Date: Wed, 14 Oct 2026 16:05:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 0/5] nvmem: Add a UEFI variable backed NVMEM provider
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Jeff Johnson <jjohnson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org
References: <20261014-b4-nvmem-efivar-v1-0-187c85f65018@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261014-b4-nvmem-efivar-v1-0-187c85f65018@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 1EemwP1hapHfEL6e2DS9HIwJhU8fQplo
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA1NiBTYWx0ZWRfX19hxKzDOaMJZ
 J7SweDLwNfaMrCsOWGGr9lWK8xwY830vX3NiQlt9u9BWh+Ud7NKifWsIEENG/G++0q3CMrp0zUe
 GnUycKfCpUHtDgbZPlS2fF7g+9iB4sA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA1NiBTYWx0ZWRfX2DfmSSFG3jdt
 1k44F9nTpaWuWKjWFUSf3lb6tFqe60D5l7TovAbYjG5tECaPEs1cImvr2PJp8SIRgR1RO7YWXqn
 O2i2rRtwX2/smdQIkdPYVBM2EDl2opQL9iRSGbrZydR0slzOufuJysyoMd1lPebuFIy17etvZhG
 hmIOXVkEZTHkv5myc51HSQ1VSFtIKkNd5JOKi2hG7/zTZK5M5TQ/2kiLUgdGCTAX15cqU+vYRdG
 WavVcx20P7iA0TW7KKqEVbnw1184e2kB0kKCJSGoJs8c8CnVsGR3PwZud+FAiyVUzjyOr5LGOGu
 3pGTnQa+I+FksHAA6p8QH+HKDh1YZWy6sph3FcHCj7Dh+5gA8VSFmOxx2tg5QVSqRx0FGzkNnqv
 MBo3bavx9sjCQVXj8jRMid9Ks+qbFfCad75FDgG8MvsKi8urbx++kz2PPstSR3aetV/g/2mSj0z
 d/SH2kRUXHsUaCfcbxw==
X-Authority-Analysis: v=2.4 cv=fJ6sTpae c=1 sm=1 tr=0 ts=6acf8c50 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=PngBsCrCUa3bum75zpkA:9 a=QEXdDO2ut3YA:10
 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-GUID: 1EemwP1hapHfEL6e2DS9HIwJhU8fQplo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 adultscore=0 impostorscore=0 phishscore=0 bulkscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610140056
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_070609_207000_FE4E803E 
X-CRM114-Status: GOOD (  20.04  )
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

On 10/14/26 3:02 PM, Abel Vesa wrote:
> This is an RFC: I do not expect it to be merged as-is, it is sent to get
> feedback on the approach.
> 
> Some values a platform needs (for example the WLAN and Bluetooth MAC
> addresses on the Qualcomm laptops) are not always available to the kernel
> in a convenient form. They may live in firmware-owned SPI-NOR storage
> (e.g. a DPP partition) for which there is no straightforward, universally
> working way to read them from the non-secure world.
> 
> As an alternative, this series allows such values to be provisioned once
> into a UEFI variable and consumed in the kernel. It adds a generic NVMEM
> provider that exposes the contents of a UEFI variable as an NVMEM device,
> so the data can be consumed through the standard nvmem-cells bindings.
> MAC addresses are just the motivating use case; the provider itself is
> generic.
> 
> The first two patches are the actual proposal:
> 
>   - dt-bindings: nvmem: Add UEFI variable NVMEM provider
>   - nvmem: Add UEFI variable NVMEM provider
> 
> The remaining three patches are included only to illustrate how a
> consumer would use the provider; they are not meant for merging as part
> of this series:
> 
>   - Bluetooth: hci_qca: consume a "bd-address" nvmem cell
>   - wifi: ath12k: consume a "mac-address" cell
>   - arm64: dts: qcom: glymur-crd: wire both to a "MacAddresses" variable

I think we can take advantage of Loic's work here

https://lore.kernel.org/linux-arm-msm/20260507-block-as-nvmem-v2-0-bf17edd5134e@oss.qualcomm.com/

Konrad

