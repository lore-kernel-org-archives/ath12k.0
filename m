Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E59E41090234
	for <ath12k@archiver.kernel.org>; Thu, 19 Mar 2026 14:26:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0WO3yovuzRdjBUY2nE2AcEq49hPJ3M31tQHHQvF6ywA=; b=MrUvpe8KGh2rJ08Lj1sVJ4cC2x
	X6t5YHmfDbMrXsfQmNoipzmG7mekqjPWzt97ccm0DWnezgbn9/f15wlQM5slpQxUJ3QDDwQJS9/yI
	e05X+4ppVxaWRqC5RqFiRV1Pe4tFVDUWa2V1OPGcunJDEuyUCMQcQE5QpERjMSqWyZjGXUP2TNKXl
	OwCo0oxoo1Y9XSEBJbZI9VtE03TxrYRttwYh5yRgdK1P+AX3HXk8bvFsHvCUjfnOrKdEFGI0w7PRy
	qprQ67vChxB4a7FLUtT+IDvQyte6Fr9tDqpYNn89MZfi47Gt7nqDubk6UeoBYhIHm6QD2amnCnzRh
	ZNvQqLqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3EKs-0000000AnPe-2rKn;
	Thu, 19 Mar 2026 14:26:54 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3EKq-0000000AnOS-2tTd
	for ath12k@lists.infradead.org;
	Thu, 19 Mar 2026 14:26:53 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62JDFWB5694455
	for <ath12k@lists.infradead.org>; Thu, 19 Mar 2026 14:26:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0WO3yovuzRdjBUY2nE2AcEq49hPJ3M31tQHHQvF6ywA=; b=QarXSthNOTFkFQkO
	al/Azz2zcOzljz5BjrIOubnbmfGGbJxmmQ6cd3iZzccgYCrqJkS037p8ei3Yw2FW
	fMzY7wYL+M5x2a7CvA7ibvc7ftLepU8jZ7dSDLW/7wr4j35FiC+FuakovAkA5bEm
	oGhBZx90FsY6NawlnD2SuBkSEDvQ96PcWAnwDx73MXSASpvIq5ZWduCJ2vU8umlO
	caIcH0KHhMuAYkUt63XzSI7fCMxfvrzce+sUtWLDPgdWVXG6MaJGGEkZZ+JBYqeT
	9j36iOmD17f1976Lp7w4hBhFRavlaBWubY2hiT8tzn47U08eYCOK0hBVP60sOrdU
	sPGUNw==
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com [209.85.161.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d083ra1ta-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 19 Mar 2026 14:26:52 +0000 (GMT)
Received: by mail-oo1-f69.google.com with SMTP id 006d021491bc7-67c21b7d5f8so114212eaf.1
        for <ath12k@lists.infradead.org>; Thu, 19 Mar 2026 07:26:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773930411; x=1774535211; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0WO3yovuzRdjBUY2nE2AcEq49hPJ3M31tQHHQvF6ywA=;
        b=GpMa6uxSeJhKpFBdY6qRMx8RYSGWIxSGic9Rip5ZmlHY6etorXwVxSKEuHiUErwmXh
         A8thMdQr3GKo6jbT/W5tYzZWP3bUx/gy1xpwtSFOly7pyGKl6EHMRHzZ1KY1S40X1iKU
         kSSa+h/ZKUkzvxcklum04LsZq4TaEeNiZB4s7GMcZ5Bv/JjveTHvODzuN23UVMaIlIm/
         rBBNCLfWriLrqDzWVZBjR4hp70Til3Ij6lF1gBLwsxWRjOlmzuNPh0bFkNdaq+67wFGh
         EzL/Mg23msYY6Sf/wVbEPH5yN1J/HM5Ol+rd9zMZ7AltkDxxzim5UGKECkhghTawynjY
         55OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773930411; x=1774535211;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0WO3yovuzRdjBUY2nE2AcEq49hPJ3M31tQHHQvF6ywA=;
        b=oI+g1aFMHwGetK4qLfxSKJkNdXKZmM4rKto+1wKb+x+izaMUcLpiCrjpTFpcITdg1Y
         b6NqswaqADT60N9GXml+xoHtoEgz/CQ/2ae4LDPhcnPy41MNw2e8ablUP8lheeNjlcpr
         oe4czQlb5gvCf4iL2zcDz/15l4tBm7KE2+dW3tbw/6j8CSZD7QlydYFjntqX3/csngHm
         WOOgRvShfeK98eynsYMjWw37UGGNPKF9/hITmSHzzbJQhaUPhV9hro6Gjm8Zyt0LDCml
         jgvBi4rbaRgU+w22d1rm6v3IFtN5KFrmcAZWidjt7nV22q7U2s+Msmb8LRi0d513emWn
         99oQ==
X-Forwarded-Encrypted: i=1; AJvYcCVvifivEEi+qP9MsblG58IrBnIpQVyqDiyGmF8V+wH2+o/ePK1nZwOkc+hw/+hXVsO6PFexV0M=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw+deuonXuLhlvW19A/LyH1PwPjAC40mi0q+lXgwPcpQrmPoJMJ
	2r6SbT3dS7nwVdq0GZz2UjZ6uzt3THe67rERt/ML3W9F7eJUmdJh7RQa0dc12aUfLTiPA7tAnhL
	A8CbVMTJvKOTJyGuvv6IwoAScU3pUQfTsZrYEYjQ5AP/K6PQNjc8Id4499rrFyIeY
X-Gm-Gg: ATEYQzzv3Nw7+A1GlUGR3oyIRt5OG42oQ6g6jh+wvbzErzjnFWVz3/yCjhRrsA/YXPi
	Flf2G/y5gs3H+6ueuaqA/nlIV+IFDme8jv5nwcDdmBsxi/xUjl9yaFgOtTXGQXGHSporAf8LbmX
	6gGJ4B18tPtFXiOzioe7IIWfExP53qKMgnuHMvA7l8ZNDCA6m6rr1qF3aGzH2j8G2QBMj2Uk7LA
	QeDwrpACcCEZKtSzZX/t2iXN5SsrWdFlyzTjkobfBOFg9H9jQEkhFcwryLk+2AG7JfwLGT+uv1i
	bW1DWfPFqmT/ZNUgWJ180ayJS8Fip0Y4bf3QrHsk3X53ZYRrHdyJwxmfd5lnoZYezENNlV0Oy6Q
	9a6qIDpx7LKsBO+5P+LuhWvhGxb7fgQDQbt4Cz49baasHq+FSZeJWPJe/HWVg6Jhbj6b8rUEn36
	GmP6OClHhFMCMVbA==
X-Received: by 2002:a05:6820:61f:b0:67c:1e60:3e90 with SMTP id 006d021491bc7-67c1e604939mr746066eaf.6.1773930411243;
        Thu, 19 Mar 2026 07:26:51 -0700 (PDT)
X-Received: by 2002:a05:6820:61f:b0:67c:1e60:3e90 with SMTP id 006d021491bc7-67c1e604939mr746016eaf.6.1773930410817;
        Thu, 19 Mar 2026 07:26:50 -0700 (PDT)
Received: from [192.168.1.41] (c-24-130-122-79.hsd1.ca.comcast.net. [24.130.122.79])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-41bd2d14b63sm5729630fac.16.2026.03.19.07.26.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Mar 2026 07:26:50 -0700 (PDT)
Message-ID: <51e28a7f-8362-4bf1-9b9a-9af9cda1d748@oss.qualcomm.com>
Date: Thu, 19 Mar 2026 07:26:46 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] wifi: ath: Use the unified QMI service ID instead
 of defining it locally
To: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>, konradybcio@kernel.org,
        andersson@kernel.org
Cc: linux-kernel@vger.kernel.org, Alex Elder <elder@kernel.org>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller"
 <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Jeff Johnson <jjohnson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Kees Cook <kees@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Arnd Bergmann <arnd@arndb.de>, Mark Brown <broonie@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>, netdev@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        ath11k@lists.infradead.org, ath12k@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-sound@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260316171419.2619620-1-daniel.lezcano@oss.qualcomm.com>
 <20260316171419.2619620-3-daniel.lezcano@oss.qualcomm.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260316171419.2619620-3-daniel.lezcano@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: hK0aCxhfL2pRDU4W0KMvjvsk8oUaBAeV
X-Proofpoint-ORIG-GUID: hK0aCxhfL2pRDU4W0KMvjvsk8oUaBAeV
X-Authority-Analysis: v=2.4 cv=ApTjHe9P c=1 sm=1 tr=0 ts=69bc07ac cx=c_pps
 a=lVi5GcDxkcJcfCmEjVJoaw==:117 a=Tg7Z00WN3eLgNEO9NLUKUQ==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=yAZrW0GqhKXZdV71gCQA:9 a=QEXdDO2ut3YA:10
 a=rBiNkAWo9uy_4UTK5NWh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE5MDExNCBTYWx0ZWRfX4X1RE6kHEJXv
 4u7vACS6HeASxLU00imjLlsBpRwXozLHyE9V4Ec7kbtGDH/Q771KmYUPv2UGScL3M3HNZRgyFYR
 mRG4S6+KdADZWI3n3UuUACWjevXyHqZ5vWa95v9aVPHci8qmw1DiaHeI20opxrlNcr6DvJfe19r
 dRYy3HYztGwRAZt1dzjepTA1PBG0VhsRQ4LM2MdDybrQmv5JpklWo2trCftW/FYp66K6UW3YOUW
 k+1YhYNchhksgHArQPc69iES9dPrHIq1nnyZhttyTu7f2lwaeBqplI9PwIkBBLgUFdWCUcrVk2E
 Fp2pVjrOgLMWrd/wOeRFjaRguAro6z9hZDJ85MjXPr6uYo/Pm5lTCQ5h0DjQfpXEG0fWv5vkWQR
 fgbA5Boq0LQzDetZpcQBoDHxeAFN3W5tlR54igf3qsBkQ63fNNPmY6mOm1Ze1A4COzAKkzvPME3
 8mmxK4ZPrFDSEiruAmA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-19_01,2026-03-19_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0 suspectscore=0
 clxscore=1015 impostorscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603190114
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260319_072652_726181_E88EC0C8 
X-CRM114-Status: GOOD (  11.54  )
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

On 3/16/2026 10:14 AM, Daniel Lezcano wrote:
> Instead of defining a local macro with a custom name for the QMI
> service identifier, use the one provided in qmi.h and remove the
> locally defined macro.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>

Bjorn,
Feel free to take this through your tree since I don't think it will conflict
with anything in mine and it will take time for the definition to propagate
back to my tree via the normal workflow (which I would prefer over merging the
immutable branch).

Acked-by: Jeff Johnson <jeff.johnson@oss.qualcomm.com>



