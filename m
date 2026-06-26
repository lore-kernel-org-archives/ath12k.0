Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AA5BC43458
	for <ath12k@archiver.kernel.org>; Fri, 26 Jun 2026 22:29:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cpTIccj1jSFJcXJxkNvk9/xSpYGk0g1bhthA7MGUXpg=; b=ypdnk3iUMkQepanHtnP4gQyCWA
	RlQqSAVTUbK3Kr3umRgP9BUrA8MlfmvNFUSJDOFFqxyvXhprTLixVKqtULkCcjzw85mKxQfv39ymP
	I+wdYdfE87N/318T/ZwpFDQStSy5czvErmSg/pRl/nPhBmwk3/B1xWdFEsIt3a6Iik/mweFqyneSe
	z5gJLc58JL2x0qsbjE3j+AGi3g05H2B+5KroUPtj18UETCwUHaib8T3BbEmBRM1BreMzKjoFoaGEO
	yUPz3p1+FvFj9AAHU26fKCNovZGAZaXqa9RLowLdpV+iG3ljDXzNo+bel7866jWpfmPVTw5p7KyYI
	i3+7py5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdF3e-0000000Bybc-3VVZ;
	Fri, 26 Jun 2026 22:29:58 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdF3b-0000000BybG-2qNX
	for ath12k@lists.infradead.org;
	Fri, 26 Jun 2026 22:29:56 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65QJ8oBw2309901
	for <ath12k@lists.infradead.org>; Fri, 26 Jun 2026 22:29:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cpTIccj1jSFJcXJxkNvk9/xSpYGk0g1bhthA7MGUXpg=; b=ILKppnX7QLtEwsQn
	h83gwfk5PKqOYothTWR7zhuSoQUttv/rg0G00mvtKQGDNe+gxLpaXfRcNn47Bp/6
	mbj8EIUCAek6TiG7GMCdNSsfKh72neDI+y9KwCGkSxYYqrvWDPOngs8hwfzzWN32
	aWiW4aqRjFwKMctkI5KvJT1OsI7wvdYmVhZpejrVjAx6TGiQzvbX0m/kI9jsRciL
	HB96eeyHN5IA9jgLT2hFjIauBoo25rGAia0MxA1kgypui9nMumsK70LxFVl26Z16
	BPAxApOvQjQZl8MZA9AJ41ZU+aNyw/JBuGsbuvmhOjO29jeoB8cdS2gLV9Yf2+xy
	AxQLbQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f1tc3hsu8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 26 Jun 2026 22:29:54 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-30cb2bcbf7cso314230eec.1
        for <ath12k@lists.infradead.org>; Fri, 26 Jun 2026 15:29:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782512993; x=1783117793; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cpTIccj1jSFJcXJxkNvk9/xSpYGk0g1bhthA7MGUXpg=;
        b=jCRlb7mA0ct1Y/iB/MMlARqrA1smpRXy5jryzcP9qg40p5NoP9T9u+OQ927V48MNpx
         MMNADoSLqgYIkHIgNNljVB7LVhx3snrnP6GmxSzYhR93gxYdvp3yjoylLijgASZc7IRn
         dZzYxkgGxDsqXz7fBJdmpfYrtBRcdwIJvVY4/PIYjDbuZGyKtHwNEU1KcxQWEFAXzj41
         TFxjTgWIyKvxY+y03EOhy5vsq8HcHiqpRVll5ZyKJ2ONHwSjrWXgi0dD1LPMJnImm3nP
         Pii4gPx3ZYUvn4oXRZOraUprIRW/FFcIpeiM8+14QpgrU9IS1ZtiOFbg+KCA1qdjdBl+
         hBDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782512993; x=1783117793;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cpTIccj1jSFJcXJxkNvk9/xSpYGk0g1bhthA7MGUXpg=;
        b=V3DP2oKHyI9v6yO2iaRalMcCDlIeLT3J/BlmtV5CPLwyRQOBTE9rGhBJlXJqyxj82O
         MVFM8fOXU4fAVZYhsx4dGm2228GbT0Tb/fm5VRL8JLn0/n9/INi9ZnkpCcEFlhIZRwxx
         /lX73KatLHJ8UAtPc3w70Yt3Ja6nsG+PD/OW/dNoevGbdXvwpgg/ARZ/5gFC01g0D1K4
         WodsnhQBXTl+YJ1psGsO2M1FPYFl7gkBLfOthEmHzxpf44VRd3aUyrZMoQCL4Bhj3gcm
         r4DG8jQyBbVBlEZuscyi4wz5lpcMGeT/hQi2176nrzcRFk/WjYih06v/yVawJCKfGnmx
         Gnaw==
X-Gm-Message-State: AOJu0YzSBTDzSchfMTnYGd91TMdfZtUUM4vPLW8T2sYGvdAzUq9PO4MQ
	6V7i3BhykUJ+3FkQEDjmTxCKOMmm581se6d0IafyA4yaFsx6BComBU0tqllVzHJAA9cw35lnhME
	g0A7qB5Z4eDcRnzVJuzyC2p3gH9cjAWOyV+8ouhlhb1Mb891nI+QysSx6Y7vSdlrC
X-Gm-Gg: AfdE7ckznBfJL1H7Tn0V0L/H7Fm2AF7ot9nY4Z/8Eev0/7PjWhYkKa33ZMwedfZXfLt
	C9V0Gy0Wam4wNzu81HYpVb1Hf/cHF+dpdvBiX/CbsfkvXFgq6WuRbT2d76LoozjAdH5bQmbUoP+
	I22qcBUSsmKMxaAmf9e92xyNTp96QgBk/Z9aG5LCihkqgOWWeHhRVxFLdWYlsHstrIv5rAj144S
	4lSMH8wH7qaDGVeEFvCHvMovI7PPZRR01p2B3GJd/W4Ldd/s/dczHTbvKXddCOWhIUw5IEYv9uD
	3I3Ce71CNlDRwTLXgJKJ6tR26AVkN8gbYQPT6IXEKSiDLalnx/Cm/eN1QRBtjFwqLct4zn3wLby
	IOarRpB7t3zxTSKhJB/cJxWMU/KH9ssUVUkNiVVFMsoiZhQpGjaYx7JRgrfilyRYkUqpy
X-Received: by 2002:a05:7300:e410:b0:2ed:e12:376b with SMTP id 5a478bee46e88-30c84d9c58fmr7591914eec.33.1782512993295;
        Fri, 26 Jun 2026 15:29:53 -0700 (PDT)
X-Received: by 2002:a05:7300:e410:b0:2ed:e12:376b with SMTP id 5a478bee46e88-30c84d9c58fmr7591889eec.33.1782512992738;
        Fri, 26 Jun 2026 15:29:52 -0700 (PDT)
Received: from [192.168.1.11] (222.sub-97-215-84.myvzw.com. [97.215.84.222])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c7c570b7bsm20824461eec.12.2026.06.26.15.29.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Jun 2026 15:29:51 -0700 (PDT)
Message-ID: <a59d54b6-54e4-4d79-ab3e-6e6cd2233e5a@oss.qualcomm.com>
Date: Fri, 26 Jun 2026 15:29:36 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next] wifi: ath12k: reset REOQ LUT addresses before
 firmware stop
To: Tamizh Raja <tamizh.raja@oss.qualcomm.com>,
        Aishwarya R <aishwarya.r@oss.qualcomm.com>
Cc: ath12k@lists.infradead.org, linux-wireless@vger.kernel.org,
        P Praneesh <praneesh.p@oss.qualcomm.com>
References: <20260619120751.363340-1-aishwarya.r@oss.qualcomm.com>
 <CABkEBKYmknpO09Yc_hM0XM2ck3F8zjmgCuyBo96usXtgkGeo_g@mail.gmail.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <CABkEBKYmknpO09Yc_hM0XM2ck3F8zjmgCuyBo96usXtgkGeo_g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: g-w86o-rwjs0zNToCuDmdolxgEkjyJUA
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI2MDE4NyBTYWx0ZWRfX7EjLgT9PTx85
 W9bWlRXx2PLL//tVDLOttAN7KOW2dPDzkd2LptqgKA1BlK1jhkJtYHL97giR5jW9XiEp0qr7AT5
 QhlX+0VJFsApk+giumcZ+Q+EB34GfGY=
X-Proofpoint-ORIG-GUID: g-w86o-rwjs0zNToCuDmdolxgEkjyJUA
X-Authority-Analysis: v=2.4 cv=T4m8ifKQ c=1 sm=1 tr=0 ts=6a3efd62 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=i4k25I72rCCN9bAAQd7+Jg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=g8aG6eahwlamQC_Jy7gA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI2MDE4NyBTYWx0ZWRfX9/ehqq5X1lUi
 PV8yWr3YjiNxiJpc7Y2RoHm1CgY+zLdsKCmMHYHBJxsJZE0uof6X31BKV2s4ZckIs0tjTG23P+q
 tufEYA0tqzJL5CJyeF7o3DqDhTkfFHr+SdNY9bu/hBKohcEl5ggDdMKi1WqNZ2vbXd/79KhJBmU
 Ii3lVrW8rGxgfci9CWNt+0TnEDQhVtBk1oLVCPih7vt3Oggoe55LNh4q1QvjykxKiGv39EjkMd3
 Gwszr2lLP3+BFEo2X9wbmr9uelr8pq0tnMdxJQmqh2VrfL4lkeL2k/IverVTjeXktFdbq3ETPa4
 /fs4qukBqmb85I6Ms2su4Mx2hHUgSYtBuSEHLV7D69yIWcNf4mDjTpU57MISvEZQ3caceHbYEyx
 dcvv2YOXGr/6G1jHIjGRue+6ombBW94eA8qxCNUvhNZVrV1iJEqlPSlT5S3eB6bXsJZxgvq60eo
 hXVhTwxmSSyz6tV+jaQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-26_05,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 impostorscore=0 suspectscore=0 lowpriorityscore=0
 spamscore=0 malwarescore=0 priorityscore=1501 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606260187
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260626_152955_899613_C084540E 
X-CRM114-Status: UNSURE (   5.41  )
X-CRM114-Notice: Please train this message.
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

On 6/22/2026 2:10 AM, Tamizh Raja wrote:
> Reviewed-by:Tamizh Chelvam Raja <tamizh.raja@oss.qualcomm.com>

Reformatting so that 'b4' picks it up...
Reviewed-by: Tamizh Chelvam Raja <tamizh.raja@oss.qualcomm.com>


