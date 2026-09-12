Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71DC8C88E53
	for <ath12k@archiver.kernel.org>; Sat, 12 Sep 2026 12:32:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RcgdAk8cNLto2WtclY2UGYFIDFDob1kxiwZg+puCrSc=; b=yUD6PfgnwHGpSAAaC1evi8Rw5F
	iDduC2aCL4Mmpe7F+G1M0nUviDGP92gNQ+snZEKuGASAkCrNe9wjIN+Wh1Z3AoZuPujSAADM8JHIW
	azWS2psK26FZ7mo1DwpvEVjTFzkFxfEqUFwKoq5NhDtN4Sz8XpOLPUgne6HmTxOfaICSkXsDtrC4P
	SHr8hN/C1MbuHmdgZPFh6DbEqS4aycx47U31qRXIuNetQDIefhkfdR07EN0HetCI/JMvEnUqs3LHe
	nAt4YJmrWJcAHOVkdUy/cW0Ua/iEmf1wHx4wvwYRD4xEYiUSA8xudsrQsJ97U2hfVCotsZWuOc6mY
	j4dDZFPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5Mub-00000000rb7-0Izl;
	Sat, 12 Sep 2026 12:32:53 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5MuX-00000000raK-2GDU
	for ath12k@lists.infradead.org;
	Sat, 12 Sep 2026 12:32:51 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68CBdYao2779754
	for <ath12k@lists.infradead.org>; Sat, 12 Sep 2026 12:32:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=RcgdAk8cNLto2WtclY2UGYFI
	DFDob1kxiwZg+puCrSc=; b=F+PC6EgrUXIvrub8LFoqBiF5YzmN1QXuT7rQP3tk
	ZA0uwmesH0s/X/ZsQi9P84xajxiBBklR4qDf9QDwjMQJAt4uMqFzzOnrfDhy1iwq
	81eXGIbmjIzHJh80sYY0mRAlRfjL4jS9k0WwQpgM5opYI9pfhuN3L3tMK5VfL985
	iA3K0bUFMGeslRGe/F3VC2k74v3IHobU5rrtYl6Ml8LzbQTiCbFcmAp2LyA8ciKc
	0aaqxvm/wnq7gf9JcBI2xMM276H3dS5mxmsids9ukF9qKwUm9ijABp+Yo576GrM6
	I7Ddq/gi+1ztTLFPvlhDTqIEubdEbIK8ykPJ9bUpWfKfgQ==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9d8wqs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Sat, 12 Sep 2026 12:32:47 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-792f917d31aso1421524137.3
        for <ath12k@lists.infradead.org>; Sat, 12 Sep 2026 05:32:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789216366; x=1789821166; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RcgdAk8cNLto2WtclY2UGYFIDFDob1kxiwZg+puCrSc=;
        b=bAlnz5FUTxY5ST+Mp8GVFdgNgLZZfQJeTHQpAqAYEGkcFgix80OYUhuI1L9FwyZp4H
         5v85a1tVA0u2XnZMkBF/oT96AfDS6Wqtq9FhKjtAMmO2q/a/UrFLD95N03NAyXfwdVdS
         obAcV5PhMNiN8OpoHgtXOIyVpcgmllZS/3hONP5WZTpOXnPa7cfV5LZAyZiiQKHdK6V5
         fzjrBSvXq5wpAnX5LiA/eNLzEruD+drGdgcCZCdjWDlyLXpVVbNRHR9lOqlsn59IidvS
         aj2v99KDmIaaQ3p+5rd8D6261UqfoNh6lfWtIi0dTejk1nth3izAt0Slxf+1C6Lte650
         3Q2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789216366; x=1789821166;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RcgdAk8cNLto2WtclY2UGYFIDFDob1kxiwZg+puCrSc=;
        b=K/MP1QTEW2P+bva0au/n60DnPlnEVLrmnkEnsbV83MTMSrDg1uMnHnGyDSCOHbrmqV
         r8gtyCHPRGVeQqMgFERRAWH5pil8EV8XHhZuHNnGW6fSFZRI70X1QIQGtD3agRCoDlhr
         tM/ZyAGEhnDOoTDouWZVHXEerIDook/03AC1R+IKLgOLTgJIpFQDuISr1uq8JCUin4F4
         PpYKO4atlKxijRvFVumBccTFvms1gcxxAEIrZ7iv+JxX9ySxVaEaZ6ZJMl176dkJbun3
         kVJ+8El+TU1ub4Y6/dah4b68feKCv4fh1tzptkyuPm2EIklAMlS1knCN2jZDH006GJvj
         14xg==
X-Forwarded-Encrypted: i=1; AKwUvByJZ4aPbRNIvJeYEM665kSILmfl78mYy3zf6F/K7cGvQJsZZu4kqxzgUJ2H51hzevNRwPNugxY=@lists.infradead.org
X-Gm-Message-State: AFuF++kvncpph6Me+vwjKFABLhgasZO8i0akO8yXoV2NfPZn8uWcX7eC
	55gKDyvMtA9WfLPD2jdMf24kilDOJqPzrjxQNyyA/FapFo3Vrlr7getyNNtJOtJ/jrrglktsqEd
	/AlXt8Ooerk1vpAvNlp4twXdSXH3DDhkIS2X96ZOlsEqbWpAOb0Ewi465SI/JPfFW
X-Gm-Gg: AYBFou18OKmXpE3HJInFaEdShwq51N2D6Le4AdgKWF575akQ8f2KHh3qGtRWW9PupDD
	/xq9CbFhPqERLgvJA4s+NudnBUV/jjOY4cKfpuHe9w27WeJMW3GVsEtwSkPRUduIBeBTiD5c29l
	4MAcS3GGFsioWGT33HvcRgYE+a0zao9H2hpixY3WzePNoDEGd8ip+gks4Kyq7oWLVioJYZSe0Nu
	OfZqAfcpi1sMdV3ffwpbxHcrLA/5xOPFXzXEWzVtzTWK2u19sa20uoL77rVXN/uUZDJgzxc5TeJ
	3twPYvoJZaAD1LlluK4NRPLikqzRgHR5pj3BML1ZUXKoroIlvYOtmI5ZnyPnbc/oeec5I2pA1uB
	hZJbuqDXs/IaS8Ba8yqQPRVAPWiI3QNqwMVevxIhfn/J5611DBb+d+Hj7ZzVPi5+HxE0Tz5yIfX
	XXKWOMf7F4GUD2
X-Received: by 2002:a05:6102:2ad1:b0:784:b882:9567 with SMTP id ada2fe7eead31-795a7e2d4d4mr1504279137.6.1789216366545;
        Sat, 12 Sep 2026 05:32:46 -0700 (PDT)
X-Received: by 2002:a05:6102:2ad1:b0:784:b882:9567 with SMTP id ada2fe7eead31-795a7e2d4d4mr1504270137.6.1789216366126;
        Sat, 12 Sep 2026 05:32:46 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8a047a643sm1202626e87.70.2026.09.12.05.32.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 05:32:43 -0700 (PDT)
Date: Sat, 12 Sep 2026 15:32:41 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: linux-firmware@kernel.org, linux-wireless@vger.kernel.org,
        ath10k@lists.infradead.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, jjohnson@kernel.org
Subject: Re: [PULL linux-firmware] ath10k, ath11k and ath12k firmware
 ath-20260909
Message-ID: <n2imuih2huckb2r6weqfydj3pygw235egmmsm2ug7gqc7ud7on@jwh66v3csydn>
References: <766a6ea9-f670-43c7-bafb-5c91f49cb451@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <766a6ea9-f670-43c7-bafb-5c91f49cb451@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEyMDE4MCBTYWx0ZWRfX2DrVTjLHXFrZ
 9QVPBm9b/rfkAyCVeU41OxMrlmllR+6Pq9pr0MMNhfHL5CZ4j7fG5t1hBhsTtU03Sm5dyYEyYD8
 6dC1Bf7i1+yhDKZ21tyDjHXyzV9bZxiGeereaxedgJBi0szv+RPXX5Aq0vgNM2C9lMULETjzou5
 D2Wp1bOh9Dj923Ad8YtRTleFbVvuNcvFlLzy25eSP6825eEGKh6PFAcn0e3mmTKV0PvAstWwkJp
 8kYtmZCkkLUT5w5sTwBzICpmEKsEXG5r61HGJz+07i5Lmd6uw93mjoJo/dACSxgugmDV7rxsvXL
 30qOKXykqtNx5Ugfo9aMUohQmFvwfqeEiOFB7RdBvPLINiZ9RRF5WOvHVVGMEtpUnrZrAiUu/X0
 FuL/17COF/E1y4SqZ7il6ZWEHUvzludbNhUD8sk0YRODQ0/v+uZLn57GmcmZuXG3RWl4nhWa0Us
 /FnUQkVgCKp32aA5gIA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEyMDE4MCBTYWx0ZWRfXyb8vMJdJg9J/
 w0OzLh9Dsrj9oxlXjxU4HqdHXs1S/TystD19YzxWw4lT5cjejEHfdp+wjS8lWcCpYB9kylbOwaw
 9RjIMQfB4JUKsFBT7kJv+TnS1Pv5rrk=
X-Proofpoint-GUID: aA6vgFAc1JA3ef85b8Nz3fW_AONI7CUW
X-Authority-Analysis: v=2.4 cv=OeUNnRTY c=1 sm=1 tr=0 ts=6aa5466f cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=p0WdMEafAAAA:8
 a=Cll3ooqCA_IsHNaTrZ8A:9 a=CjuIK1q_8ugA:10 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-ORIG-GUID: aA6vgFAc1JA3ef85b8Nz3fW_AONI7CUW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-12_04,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 bulkscore=0 spamscore=0
 priorityscore=1501 suspectscore=0 impostorscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609120180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260912_053249_728749_449932F0 
X-CRM114-Status: GOOD (  13.70  )
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

On Fri, Sep 11, 2026 at 03:13:14PM -0700, Jeff Johnson wrote:
> Hi,
> Here's a new pull request for ath10k, ath11k and ath12k firmware.
> 
> There are no changes for ath11k or ath12k.
> For ath10k add firmware files for the shikra platform using WCN3990.
> 
> Please let me know if there are any problems.

Merged and pushed out, thanks!

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/1238


-- 
With best wishes
Dmitry

