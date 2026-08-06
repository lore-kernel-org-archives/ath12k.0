Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01437C56208
	for <ath12k@archiver.kernel.org>; Thu,  6 Aug 2026 14:40:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+3YyQPwb/WShWVMj6aShCPiAWwBLkUJzAzdABEvWRhg=; b=cHyuMaTpskQoX80Vxucxu+DZNc
	rhrGv/MrXEuGLXwNi22htapnUAg+fx3bC/oswLUUP3NnJlwwb9woBENeDt0mrBWoeK4IMwNEYalYJ
	XWXjT/v9pWmkc0KAMqtBObm/EiMn9MNSR51s14P6lfCbGwrZD30+fp+DSOyl9medtpomuIo/v0rVQ
	swknsmDLwRBhrXUjSAVPfyXox5pyz8RJkrwuiWZ+9TZqfSac9tTvOPkTSUwug/u3E2pyhaQxpW8ol
	Fca8JEwj10bPq4aH9OZuZEKj2IOndDsVlUeQ2gPgHR7BnfTUo81tHlqo3MVbcqmc9O0ajHjzOXfWN
	wc3D15Ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrzGr-000000060hW-2jNB;
	Thu, 06 Aug 2026 14:40:33 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrzGd-000000060eh-2tWe
	for ath12k@lists.infradead.org;
	Thu, 06 Aug 2026 14:40:32 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6769neci1277835
	for <ath12k@lists.infradead.org>; Thu, 6 Aug 2026 14:40:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+3YyQPwb/WShWVMj6aShCPiAWwBLkUJzAzdABEvWRhg=; b=G3pWi0x/T7h7P+Gj
	nZtQK++GtzDcpDLGdegvgr0jTBphibSBvIlgY7GaBbeAE5VHF1FF45od/hvhORKX
	0/nLtfrKaBkaouo7ilFlBTSJh//d6YaghSjVPbv1mIBBQdGx/qeaNd2SL2oBXMsB
	bxSVH/ignV6jnTrT+NJ25IK0Gn/RzvuJn14seoBfp0xmgZYnlZfvKNuyQbEL37tZ
	FDBMuYp4gv41HKi/zNbcK+jRpliAhgmkN+BvComMjPrTBe8bFK/wPOnD7hLxWS2+
	jhGI9eNOjvixY9GOciFR3EnE5Hctk56pXKXboSuZtgpNBumWK5vTBImYyhuszm/K
	Sq9qJg==
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvjuejrff-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 06 Aug 2026 14:40:17 +0000 (GMT)
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-4ab8b4887d4so1028615b6e.1
        for <ath12k@lists.infradead.org>; Thu, 06 Aug 2026 07:40:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786027217; x=1786632017; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+3YyQPwb/WShWVMj6aShCPiAWwBLkUJzAzdABEvWRhg=;
        b=CJ4/sM5TGJjZgI3yHC6EwAI0XltbzzeBT1xiOSb1JV+sCxguD0VjSCvxAdzkKEjiqq
         qiDcEHtfyp71A26Ia06igKGcMy9YVE9A2/79l+SmPzNTTr3PBH5Vg149C+tpeeP6CV9o
         mckFqAmFwfpHaQviO3pTHiDZF6Upg6gy7HG4Cr9thZEIrUuJ0eOfo30+OrhafiNEiXSQ
         2/uCooXsrA+6BDWdcMtuzBmfPIdB3/WYtJr+UCOywMlZnqUTDbreMEP7/PkLAcUvtQwr
         gSD+AFYl1WJMizcQn/CeDkjve0oKNqQC2KQaG7kXQGXtjk6Y3WP/UhbZ6eAqpmiD4kFJ
         vxWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786027217; x=1786632017;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+3YyQPwb/WShWVMj6aShCPiAWwBLkUJzAzdABEvWRhg=;
        b=qf6uckMG79wPz9PpXXaGutU0aNXVMyWsZgFtEvvoH9BWlIxkSPZMze/JTUwhIkDSko
         Z0LfZOKytg0qBP7Moafk5wd2IfE82u7+6PdjC88KNDjEBeDWms9I3N96oUU49vWkU0gQ
         F0GI+fvn9fegL0+amKKUUBxRrhaDzcYFXg3GCwkwd2/JEyxcaXbWiQUZ2UR00RGs/PnC
         /ZkKDz+5JaPNhqf592LqXlrpaRlqVMxPQUDkSwUTj+c9p7q2mueYzII0G8IiXGkkgMxj
         Kxs70hXysFP6ussooPh1ybcbXU0c8MAOfZ2pyJrYg71TS9OVcaE0AvZUFAJLrTxB9zGB
         pI+w==
X-Forwarded-Encrypted: i=1; AHgh+RpH9BHhjzzGa+v5WgXTma63uTboogZ2ctwuN2j8XVmJuXWbNKLBCmSCD/wshjx2PIWNdsYL22Y=@lists.infradead.org
X-Gm-Message-State: AOJu0YxGFihY8Pvq2wRyLd/pO1qqR6wxWgH43tGUS6g2YursZikstMgi
	gcbTCNU53FoQ+TF2W2fbLaz0vIgdlgQ91mRh6CjLNVM3O13Jdn8ms4YvmRCO7A+e8YlmdYorhM7
	Tm9N7MNqEE5QqZQVhUlruXhjO19sMlZ+HjkNgxgMJydnji1W0wzAq4WhDMDJCyEyaCHZJYwCt
X-Gm-Gg: AR+sD11mmfPKrwazh4PrJXsf+AcT9hdNpjsmyRvIZCSt3wItEohDSUjoadJnHOUKyvh
	oWpth33Hq6jPYpajs4Cts2giV5oKXKDcRybk1WkGiMT0QbXZaPGWZa7Es4tLfRwbnK/RNUQh5ZM
	XgmIXVTwQ3e6p5BuJQcHL+WNBKtRjems0iZTy/zVt3ZEzN/dKRtmEvaFvfKiFfRfwB8MQAby1nt
	rHNDXi3fftiNt/e98Q2thYbPGmBBW5sIPmjHtsfATc9Bzi6d5yj4VLwEYYyco+L/38aITMnI/xr
	dFKhxEME1wDgtxJhzeHrjPyGPb0hqyxUVFZ62cw5+0cI+ckQRAe62nMzfMqkAxYq5xAZISZtIof
	jV8e/amGUrH0zQY9NWvJwNmB71gArPgvMdWGiywnK4IeYfVL1DA0Du3T3Uh8O
X-Received: by 2002:a05:6808:1927:b0:497:d371:21c8 with SMTP id 5614622812f47-4afae27b56emr10048998b6e.19.1786027216802;
        Thu, 06 Aug 2026 07:40:16 -0700 (PDT)
X-Received: by 2002:a05:6808:1927:b0:497:d371:21c8 with SMTP id 5614622812f47-4afae27b56emr10048971b6e.19.1786027216355;
        Thu, 06 Aug 2026 07:40:16 -0700 (PDT)
Received: from [192.168.1.20] (103.sub-97-215-187.myvzw.com. [97.215.187.103])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4afae45b630sm4755902b6e.1.2026.08.06.07.40.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Aug 2026 07:40:15 -0700 (PDT)
Message-ID: <a9ea439b-29b1-43fc-b819-1dfce2be510b@oss.qualcomm.com>
Date: Thu, 6 Aug 2026 07:40:12 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next v2 0/8] wifi: ath12k: extend device DP stats for
 TX and RX observability
To: Pardeep Kaur <pardeep.kaur@oss.qualcomm.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20260806132427.3704828-1-pardeep.kaur@oss.qualcomm.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260806132427.3704828-1-pardeep.kaur@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=aNzAb79m c=1 sm=1 tr=0 ts=6a749cd1 cx=c_pps
 a=WJcna6AvsNCxL/DJwPP1KA==:117 a=UaEkX0D7FlC0tWE/LoNF7Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=ZeT7kjbkWLjvT54KAQkA:9 a=QEXdDO2ut3YA:10 a=_Y9Zt4tPzoBS9L09Snn2:22
X-Proofpoint-GUID: 46RaCmzFiLm_3kwtMINi9DJ44q4UROjR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA2MDExNCBTYWx0ZWRfX9GFynB50pRWu
 xlZFi8vcif7pzxVNjTwvaByMOqIF1Gi6sgBSmMw2omGvhda4+Ksnw0Xv3KTBZi61hVte4PTqFhF
 n14zcVRXzVh4N+1Ywo75k5fhWpqwaj/Gh9t98ytu/GqtcD7+zBxAZDsI+PMvr98VdSpoDtrR/8o
 gbPZOqnOAx62iNJHzJGP+VO5o4knMru32l0H0JquZhBaON8TaqG8VI9WAdldd3s/kwEOjvg1Rek
 KyBpLDCw27gDhwzuPH+OMe0VOpVzQQg6ohoglgQ7HrHeQaYlmFndYEqvfOW7YvC2zF8KNV9jz0s
 dZppb+sQ1nBO5p7rcZmoEqozAMLHiuTdt5+2gXd/+LuCRHzDnCkE/4tUT429jhif+rES4cFnrWr
 phAau0dzlDnaMa9lSiuq63/sSObMN9G900Vj0KXEGmWtQNrjX3Kuz6UlOhY1dwnpKerln9FgLcB
 7OaqY7Icvoql/GBK/ag==
X-Proofpoint-ORIG-GUID: 46RaCmzFiLm_3kwtMINi9DJ44q4UROjR
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA2MDExNCBTYWx0ZWRfX7yhmyeIQzgKH
 RsuVoOx+brj6Fu/D0IMdW3xq/YnWmkiTU54XBtMIXmqjuHXXU/PwNPirvO95+y5XnvfDKt2bJUI
 CBLiD1oXEv9X6dZH3uLeGFs4exAkmys=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_06,2026-08-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 impostorscore=0 suspectscore=0 adultscore=0 clxscore=1015 malwarescore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608060114
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_074019_770747_4A60D075 
X-CRM114-Status: UNSURE (   7.10  )
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

Why are there two separate postings of v2? Looks like the first instance was
incomplete and only 6 of 8 patches were sent? If so, you should have tagged
the second posting with REPOST.


