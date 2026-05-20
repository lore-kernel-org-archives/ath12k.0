Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 880FECD4F5B
	for <ath12k@archiver.kernel.org>; Wed, 20 May 2026 02:20:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R9jlWezoZ59nNLOicp/jz/ZV97ZhFIdnReASR8pBr8k=; b=R2Hh3mDOPDgo1/L6MyP8CqVHCu
	A6d+TE3a/mRFWlnRVjqCFpwCLjWh48PhGhSer0lsKSAgmEgqCDcMXpE1dL9BioYP1oS9bczOX5fjZ
	vb1jOSjN3NRgq1MoL1dfMgXR209uRV/nak+ZrJlemAztu+NljAd66g4kipSmLkX+ZUuxUiV20HDIT
	Y7EM/X/cOgw9mt+4xrKSs9xNN3LxRFYF9/8YYFO065beVCTIuwQTak0mHAUTKaYnJx1fzrTEh1KSN
	hYZwDkl2Y4QEanUsSJaTldv2DhetdCe9L5eTCFLC3iYcXZrgZBHpirebmtVqd25mm6U1ak1Vg+iEs
	Zb8/TJBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPWY7-00000003ITG-0Gqp;
	Wed, 20 May 2026 02:20:43 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPWY3-00000003ISq-3u6t
	for ath12k@lists.infradead.org;
	Wed, 20 May 2026 02:20:41 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64JLuS9m2983959
	for <ath12k@lists.infradead.org>; Wed, 20 May 2026 02:20:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	R9jlWezoZ59nNLOicp/jz/ZV97ZhFIdnReASR8pBr8k=; b=bwQiaycg9jM2kKFl
	311z3FQfhu1GJzvnhwo5LZM16GPPeWwoQLuIjOidZp2Z8m9LUJKFkavQiSOaomEz
	COumBhIycqou+vX1i5vqmUmBLnX7GbUgz5cyHlru8Oc3rt8tLjxcDnQQP1qu0fHM
	QjsmYpLARgSd5f8vHfXpYq04IJ+azkSz/SbwY3ju/wMzq0qtx7AJVQf9ZMg/Qh3I
	cObW62xeTY6nHpr5wZzeQqGTkVmsvWZGlCV+vvKPg215bX4D4Do8RhASJeV/eAYG
	q6E/YFNwgLfeqZMJLUh9u4Xgr8ioxu+sk6Q8xdBy12zTw6/2/1BETMvUp6FpgY1w
	iJAY1A==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8t3t2h3p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 20 May 2026 02:20:38 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-82fa7c6699fso7044150b3a.1
        for <ath12k@lists.infradead.org>; Tue, 19 May 2026 19:20:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779243638; x=1779848438; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=R9jlWezoZ59nNLOicp/jz/ZV97ZhFIdnReASR8pBr8k=;
        b=McBlnTigfNFnAwU9fyP/+FEr4NDiy80IuJeAnukh+8zLP3CHhoR8DdmyzTRd1lTvhj
         HlQ89zcDbhC6j/Wu91p3TJX3lJ0jbYZvfA9xlfrSjl/TnTzYe68AHf51cB/gt1coSIy+
         lqBJqvj4ttUcwLIBIgXzz7RICkcqSaxU0YBuwG41jY1yYAA9tb2aXsJVrD1W/zZLE4rY
         lrf71c4Wdh8Q+Y56et7W7Ki9OwdMKZwPXGisD7ZpV2ILeseevhighC8uYkmhnU0a9GPC
         +xLvP8Mhq+yDxjrmH33AwMQ5hv4Im9/siFONiJYnai3O1f25ISKaVLy0tNt7Z1TIrgeO
         mghQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779243638; x=1779848438;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R9jlWezoZ59nNLOicp/jz/ZV97ZhFIdnReASR8pBr8k=;
        b=kDjYApYTteF+98P7/bUDjG+gxOlIqaC+7THwdOQ0WIpoXO/rU58gu2vhC4OXz+Fq5V
         5sRgVBEZ1JmjdAu2wv9rTuDQMaZgXLJdLW7R+8D3SGJIqhLkXThn/PxFKABR/rpTvoky
         zZ1UnBj1bkeWtqGihvU4qEvYeRWff0AfGf9qOjydZl7W285znnYUYWotCEM9tWXXs0LU
         xaQRxG88ickjsJSsICeDCquqcjjceiSVOjazufdQE4cncXDBNlM4njKNDWvLWqU9ySbi
         STxMCrjaAVQ+uQGHbtnx7tk7TKGdNpi7GcXwa2y4NdtVN8yEhbk3fbJSTy9nfkRdXWLb
         pvGA==
X-Forwarded-Encrypted: i=1; AFNElJ+TEh1/mTWnmUfVHgn2kCnFC7ZawFuFrKkMCA1nFRRM8gAXXk1+ZnNyBV7gSzm07S9oy+u36XY=@lists.infradead.org
X-Gm-Message-State: AOJu0YzGsx6O5nUUmQizEtZwzxhchBFzDgdcZX2VuWqdvzcW018yxCip
	+vyvWpXOA+2KV47TieYzd0s3+DCWleIxXJnaogpNaX6adI7hBhSJUHu/jJfdzWielYANY2Y7iCx
	IcUSoH9A/IAoGM5wmjAmpm98QH6Owg35EyhI3w3uWg5fpfddlZQxleyqy9mcTmQZ/CGgrADPP
X-Gm-Gg: Acq92OGeMZkaMs1QQxLK8DFPR9zit+2VItPI8hWi9KZfuUlOaXnjM6sA96D6wQUFGQk
	C+QSOalDt5lFLdacM7Ql7ivjCN1iiehXEq9DTQ7RxXSfzHR2+3regKxZzubbwNwDeveXwcHW5h7
	lFn0gLEy0/lfULMc/nHSOCrnsA9ryHmlMXc5q7qe97ctAGVQH2XHQXpsZz0ZbvZfmQOcnDcrpDW
	4QQhBMFfDu79kT0OpqoLRGBKgXZ2LKte2BB+Hfg6cZoberxkFUnBjovjw04jkbq/28VVOgPikPe
	0fOkL6twHbudCok7SYNorSMPn5kqOUywO6hqkc+KdubHkTYThLUtOYGWO5EV0ZS+B8M+p9+ThG2
	HBtw64YWJAu8PvN8eWaky+8GqGqKPTdVu71mmeHpR7fUT/qlAcBFMLSvgbG0ZCwoS1GnoIhHEja
	RKxb4/ov+n0pAh7oC+QA==
X-Received: by 2002:a05:6a00:3922:b0:83e:2c38:f5d5 with SMTP id d2e1a72fcca58-83f33d96f27mr22803999b3a.28.1779243637625;
        Tue, 19 May 2026 19:20:37 -0700 (PDT)
X-Received: by 2002:a05:6a00:3922:b0:83e:2c38:f5d5 with SMTP id d2e1a72fcca58-83f33d96f27mr22803972b3a.28.1779243637110;
        Tue, 19 May 2026 19:20:37 -0700 (PDT)
Received: from [10.133.33.93] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f19f7cc8bsm19872167b3a.55.2026.05.19.19.20.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 May 2026 19:20:36 -0700 (PDT)
Message-ID: <da065adf-b572-4ffb-a428-0ba967e87587@oss.qualcomm.com>
Date: Wed, 20 May 2026 10:20:34 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next] wifi: ath12k: fix error unwind on arch_init()
 failure in PCI probe
To: Ripan Deuri <ripan.deuri@oss.qualcomm.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20260519192815.3911324-1-ripan.deuri@oss.qualcomm.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260519192815.3911324-1-ripan.deuri@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=BOCDalQG c=1 sm=1 tr=0 ts=6a0d1a76 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=hhaimfcYFxIno_I0_EEA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: O0gPN173O3UZido45gmKnBqsU5Y611LN
X-Proofpoint-GUID: O0gPN173O3UZido45gmKnBqsU5Y611LN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDAxOSBTYWx0ZWRfXx4FzqrhqnmOl
 rOR4qf5O5SBgYBpVdC55823u3kEtYtmTz6++q/PgJ8OdvsmbJYLqa20gr0GbkqsNhZP/0rg9Eq5
 TFfzXdfQeIGQ0bbX3IjDdj6CKnvNgu+PBpuw4P2wAmJlKj78hEBIRzDjXR7ZeL1IrlJj2c5eivj
 SdPRiA3m/sZbWEnRXs1ltvZhfUsCo4bWdmsbBsgFFCBr+qA7EtNj0k7YAMtUwZOb2YFBgDfvMvr
 X/mclTEdl61YOI3rIof+kplsvEdWroIXWGgBI2TBrK2GUpz47m1ylDUlGOJfPKsw5gv8aXNwsPl
 N40ZFmc5KDAqvqNn8/6kXrK1re3jwvkSSvAztGKKNx9zhVHfCTqYtqCWu+ps2L0/Y3zuAeZ5jtD
 NNK+PVSRg7hEc9fvSADhB0mCEjpGk74ZML+H1zEA6ZYEXJSpErVC5/Eb/qo8g5Ab5Qq0Sj14LjT
 hkBR3CigS3Tw042Dbkg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_06,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 malwarescore=0 clxscore=1015 phishscore=0
 lowpriorityscore=0 adultscore=0 bulkscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605200019
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_192039_979904_4DD21FC6 
X-CRM114-Status: UNSURE (   8.62  )
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



On 5/20/2026 3:28 AM, Ripan Deuri wrote:
> From: Ripan Deuri <ripan.deuri@oss.qualcomm.com>
> 
> When arch_init() fails in ath12k_pci_probe(), the code jumps to
> err_pci_msi_free, leaking resources in teardown.
> 
> Redirect the failure path to err_free_irq so teardown matches the setup order.
> 
> Compile-tested only.
> 
> Fixes: 614c23e24ee8 ("wifi: ath12k: Support arch-specific DP device allocation")
> Signed-off-by: Ripan Deuri <ripan.deuri@oss.qualcomm.com>

Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>

