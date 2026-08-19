Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42C5AC5DF6D
	for <ath12k@archiver.kernel.org>; Wed, 19 Aug 2026 11:18:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xJ6o8/EdTRaliZzL1cFz7i/XG75deALTCG1BEst//Cs=; b=PYQaYjhXAA8KGBAfA+kH/JaVvK
	hPsssirHxrWG37wkpplwSYFyWxuwQxCZLn5UGmCBrXbMcWyUiUqK5nTsjbzv/MpKt32JwlZKXUmI5
	QQJobMPGroq9zHGHTSayn9GhYjL/OdO4ohQqHoKuw1TxNohnz7E6ZPbasUNwxO+HC3DgNONS4/G9Y
	f95lTMmmS3PWh8EO+Fqkg++ZmWS3tRWz5NW53nX689L+UHcW5Ljb6VLNLqTtZZOaYZCuyXJNGp0LN
	Xq9e8MRi56cSCzJZLlP41aPHDrpH/WUkZGL1pvnDFNQmJqC6BdjsiESdgMd9aFq07MiE10RN+Vf1t
	V68NXC+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wweJp-00000009enC-2dTJ;
	Wed, 19 Aug 2026 11:18:53 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wweJm-00000009ema-1PlM
	for ath12k@lists.infradead.org;
	Wed, 19 Aug 2026 11:18:51 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67JA7dtG3661028
	for <ath12k@lists.infradead.org>; Wed, 19 Aug 2026 11:18:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xJ6o8/EdTRaliZzL1cFz7i/XG75deALTCG1BEst//Cs=; b=cTLGZAVWo0rVSeLE
	VTNSyVOTDHle+iZ/XHZPW6e3pSWRQWWcyRng37ToN+EZ+yVUiHS7UapFYj3OAhwE
	f3g6fMJqjvLkSQNua2a93cPx/m/sVaazA6Ont9dwMafAxn8kax6cF5k1AxI54oSx
	zshjW/C3d32C1OHsuNiGZl9od9dK+0oCX0C3PS7SNpdTqKWdHEkNgr1kqRHJO+JP
	WoNKEU/sr4yq06lhZ2f1BhewFmPxJkyNI43BTMLN/itEwixJkKPWX94zqf/pjca+
	VqIjkosMRGkFDQv4C9Dlxw1U0Q/Cj5wUxsBX6W/XINE87WUqp5ZGcxwEq3VcWKWQ
	f7VX7w==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4yfkjxsc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 19 Aug 2026 11:18:49 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38f283baf1fso1473521a91.3
        for <ath12k@lists.infradead.org>; Wed, 19 Aug 2026 04:18:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787138329; x=1787743129; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xJ6o8/EdTRaliZzL1cFz7i/XG75deALTCG1BEst//Cs=;
        b=HnfEcyp0WmH2KU9vzu9OtARxxc9Kd/ZypJneAptqgbW2ElDZUwRXm0MmfwokKTda2S
         pH0eqlLVd5juPdQTzMMuwvUC7M0ZPWY8lWkvU87WaH5VJMO5i++s2sW5V1bm/mhwBByw
         6NOC2EBCfZtnW6KGXXJalMJuGm2lves5IyMK6FcYUxrb5+DzhxpuK6G+64JpGyj19FkC
         gdchQxdJNmuuR5Xkxo0KLvdSo7JI14zO0DxMQPMR+HmHbBKNVHzIohr6PCB0MKJBCv64
         zHBOCd/rF8ijyIrcHBF3bWQE24yqG02NjiIHFm/dy1OgxUxpst2BkI8XiAg3nIagvb6l
         fFgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787138329; x=1787743129;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xJ6o8/EdTRaliZzL1cFz7i/XG75deALTCG1BEst//Cs=;
        b=KAg40Dy03VqAggG95R/Fc4PWuCV4LG+6OT5CXvub+mvHGFZXa1zc1QUS/DPHCgAXzh
         HcGwwmFleLGTsCQqXGKwuBMdeRynTDzyvhy7hSvuLTLi1jmA33TC93XNRvhP2gkz/j9G
         qaBSrGB5nwGzVi8mdy3TppypK5FT4UCV2tLp63p/JEvCIeU61ARZ4sjwKWVEA01H8ekQ
         VPK5BEzdGZOadZgsJh00G1CkBgmcyxMgelb2C3PA0Bz3Jo4+l4BfbEOJsemiTcFKKBsC
         V+LAohgoyOxAnBl717u8MEUFhbuEVESFcI8YAYCsi5lbEEUR4prLbXoRKa7iZnMY2EQj
         jKGw==
X-Forwarded-Encrypted: i=1; AHgh+RrWcnSH6t8Fm0QfnAmQkWyQ6sO/swKMZPDEJu6w9u5GxkWUwxQruQOqznVfai4laway9S38ecE=@lists.infradead.org
X-Gm-Message-State: AFuF++kw3XtcsNcPxpVcPYqpeurQJWB0dMMSs6w1ImfBoU/Pm87aIEsn
	IDz0IaryNgWxHLI5M0HjGVQOqOv9XjCfUX7bH0rz69kiPdrGakMKGo3FH5zBbTs/c7KkVebZPw/
	8ldBeYLKJrXLks2XEtu4tOC18EZVELpmyTK3LFEJekUiQsP244NPJ8E6/1AvQfth6
X-Gm-Gg: AR+sD124AkRnPJ++Mem/w8NmDMsbObfY0I4K3IembIKhwSHuWK/hCO/5lP+TAWmMO0L
	7u1Aj5C883WcM1WE9+tWhrOKBmbGjVnyskUf9H3aTjdWG0ZzTv+tZIoIb6JYBah2oN9iDJEYlfN
	UM0hTQBkUCC+OVRugNcVZ6eGP40fsI7cL4Snq8bBVu4fNvzBYvePKeCUcyfwerOwhjqsWhTHayt
	czoIi7zClxQCT8tg4UJhd1oz8ejs6Zwe0napNwyjdAuOE5VB+LAjh0uK62g9nYei2kxZwO7cSoJ
	H2587Do99dpVKx2c4rDJwm5mFXZgPiim6vmqJwyZxttDra3NYpim0l90PwqeDbmExo/6+zteMxT
	h+yB/NvAjqlLt0x4Y3jjgam8e+MUMZcXr3M/4eMYg7mmeiq2C9QqRMHRbzg5hOotlEaOCxkAvJQ
	==
X-Received: by 2002:a17:90b:3a45:b0:381:25ce:bcc2 with SMTP id 98e67ed59e1d1-39580aa1085mr7913841a91.6.1787138328968;
        Wed, 19 Aug 2026 04:18:48 -0700 (PDT)
X-Received: by 2002:a17:90b:3a45:b0:381:25ce:bcc2 with SMTP id 98e67ed59e1d1-39580aa1085mr7913744a91.6.1787138328510;
        Wed, 19 Aug 2026 04:18:48 -0700 (PDT)
Received: from [10.133.33.152] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3957f96cb6bsm2388371a91.2.2026.08.19.04.18.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Aug 2026 04:18:48 -0700 (PDT)
Message-ID: <25c3101a-294a-477d-979d-423e532cc6a5@oss.qualcomm.com>
Date: Wed, 19 Aug 2026 19:18:44 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next v2 0/2] wifi: ath12k: Fix IRQ cleanup on PCI IRQ
 configuration failure
To: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>,
        ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, jjohnson@kernel.org,
        quic_kiranv@quicinc.com, vasanthakumar.thiagarajan@oss.qualcomm.com
References: <20260819110215.2485514-1-aaradhana.sahu@oss.qualcomm.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260819110215.2485514-1-aaradhana.sahu@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=NoPhtcdJ c=1 sm=1 tr=0 ts=6a859119 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=JJR71pI42961Z5K6J_YA:9 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: 5xI5dVO5kc4EsdLS82xxqKiY0MV1JFP2
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE5MDA4NyBTYWx0ZWRfX62e3vbGdbT61
 sVCfwwYlnBQdHtngOfbQcrbNwKi/LWaHneEP5xXwbhxA8HcU2hINLtL0Ob6Uy6GrFEH083CVji6
 R7OyiSKFQfrd10uM68buekvifuQwNqs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE5MDA4NyBTYWx0ZWRfX8eE7HW40qXnP
 vhXPqe2dMdI8yHIGP9iKOGCUN6YX1SI4Q31XVY1GoRBtrJFzUO8ndVO3z3Uc8Ey9VUdUT6uRw8g
 5SUnpE2vnQ2iOpnWYNkP+0OBOmAJRKW1NG0Pi6g6NxkVSUZGA/pQZYXHXsilTQfOzZEb1rcZCKm
 6VzrYasRE9YyvQPpgnfMz9eKt3dIkyJUkLs6NGVBoqAwfEd0czPZJq/a8YF01e1tVgMnFrqyf8M
 U9yvScfVj3EpidOPBYTqBM9EITnJigTGmlSjhb9GL1vLt+KXv1vhtliViH8wCRuFWq5+JJ52BQd
 bcx4rHtaVwc7s5LrDxpifH6hCXcHjp82wBRzhJrb8B084lNlljPPdP6PpqcRLqohgY92ffyKCmc
 CAdnZGATbt5gHPmIg+aRpJzZ8Mu7QYNFCKyAcjd+yd5d9vpOA5/gmZvCcTs9S5vqsooTUBui68v
 q4cd7TgBjKaPEqwpXsA==
X-Proofpoint-GUID: 5xI5dVO5kc4EsdLS82xxqKiY0MV1JFP2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_03,2026-08-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 adultscore=0 priorityscore=1501 phishscore=0
 spamscore=0 malwarescore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608190087
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260819_041850_393408_2CB91D08 
X-CRM114-Status: GOOD (  10.73  )
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



On 8/19/2026 7:02 PM, Aaradhana Sahu wrote:
> Free partially allocated IRQ resources when PCI IRQ configuration fails.
> 
> The first patch frees previously requested CE IRQs if CE IRQ configuration
> fails.
> 
> The second patch frees previously requested external IRQs, stores the IRQ
> number only after request_irq() succeeds, and cleans up allocated
> resources on failure.
> 
> ---
> v2:
>   -Used ath12k_pci_free_ce_irq() in the external IRQ config failure path.
> ---
> 
> Aaradhana Sahu (2):
>   wifi: ath12k: Free allocated CE IRQs on request_irq() failure
>   wifi: ath12k: Free allocated external IRQs on request_irq() failure
> 
>  drivers/net/wireless/ath/ath12k/pci.c | 55 ++++++++++++++++-----------
>  1 file changed, 32 insertions(+), 23 deletions(-)
> 
> 
> base-commit: e07447e654476262558bee570f4cf456e2b32565

Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>

