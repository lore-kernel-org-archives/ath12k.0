Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4397EC02193
	for <ath12k@archiver.kernel.org>; Tue,  4 Feb 2025 17:20:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2UqvzkOspButWcUaJ64/oBpdNehxKDeLYx4iVQVNtYY=; b=YQ43OfXDtuowakIm29ayE3Zf7f
	bpb1W6/qQ+t9r+p5jPnbqeHcgp2JI2ZC1Sv3rucOxKLI/pDlaAvDccuX/k/hUi9K30qnuVMxkME4K
	RFvKx/nSrK/JPAaWg9lzUGLL+Zjsl1FV1dc0ZiTB8V0BAWM+fA9vOE78qtlDHs8tpAbewpT2frDyg
	ETjWtnQdfqzx9dEV0VNlVGLnF7JEogDlIWvXeqmJEiimGZ+g1ct2IBv2DW+Gv+EBz5dWRwp7s7oKa
	6tbjD25fljRxR3K4Zsumo+6dHUqE4P729tbkESm2WKied3W+wj/PkseUdmGztgE8KsExdwQZDTK5B
	yZeQKrqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfMae-000000014mi-3p9G
	for ath12k@archiver.kernel.org;
	Tue, 04 Feb 2025 17:20:00 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfMac-000000014ly-3LXB
	for ath12k@lists.infradead.org;
	Tue, 04 Feb 2025 17:20:00 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5149sfH1005794
	for <ath12k@lists.infradead.org>; Tue, 4 Feb 2025 17:19:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2UqvzkOspButWcUaJ64/oBpdNehxKDeLYx4iVQVNtYY=; b=QgLzQUSc10dfprXn
	77rhDeDSF3fPecjTy7sFRFnzZ6mw3fWtdBcwalsk7sjH3A73/O9pL6AKRwIaAbSr
	MvBbx2ihk8naNZftpTN8sn5AEmQ8KEcmjVcc9D1l8esnX9MQhqWRAexLDfbakf6T
	yNfdCpxNm9PZjYPD+UCXzcGjMfTJoLR+SS68JjnK09IVxBSbevZSzWbTM4Wzuduo
	CVLtoQj4d8ayTIVo/apFuibwW0d9bDtoG3zCqF3s8erWvTOScCAN3PM7DoiTHmKz
	ffDteUWMUZDLBqLB1xWYkxn2g5vOR/ZLMPu/BFIl1MT9Ra43EwJ+1BWHvBnLrWoq
	ior4Zg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44kgp712jn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 04 Feb 2025 17:19:57 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-216266cc0acso50035ad.0
        for <ath12k@lists.infradead.org>; Tue, 04 Feb 2025 09:19:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738689596; x=1739294396;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2UqvzkOspButWcUaJ64/oBpdNehxKDeLYx4iVQVNtYY=;
        b=v3wEKBIct8gid3PzR7xOpS6GVDRZ8OuUlorIATwo/SUb9DdJynM0hn6Ovifcyz9zce
         0C7af/k5wHcE0Rnlr2b2PUEAv89XTo1YTWPusqG+U5457ABVTX7db+Dg9AWIAl8ABS/I
         UzAp5kq4kbF51iDcsw1sz0Zl5dPq7RGTFsbSdICagiIBGwPHv0/S6u6TCMcufrxmFsy+
         Cqfvk3uNlhuTcq1rC3w9e8Zh5jfuj3eMX3vLgRUI7lw6f+7CMBt2eiLiNKqIKFvgsd84
         hjSN5t3hmyslxCODeKLFHPtmnf9Lj3l/dY2CnHphIiKN0U7VDqOL422Z3u113v6AAiUy
         Ln8A==
X-Forwarded-Encrypted: i=1; AJvYcCUQvjaFmo0ATecnZyyO/wom9bIBHJhAJXIjbsMnY2hM8QMA/sOr7dzxestaEhDltugKy9SjUWs=@lists.infradead.org
X-Gm-Message-State: AOJu0YwO+TIpWaQz6KNmF4ZPHdOpnjZeKHNrA6cZULjR6Nx6PHOto8Uv
	ShBYCCLBSW2UIHDhUrmi+f9rDgHLUCDJvYX6J6k1+nAm62ZFoCtT6MlG7mhKEIMZ12bPJIG46mA
	5GspvqB8hkHdTCLzHrRJwobQKAX8O20zrDqDoOGufselo1ViXGAQD4HuSVdns
X-Gm-Gg: ASbGncvGdpD4pI371PkiZ9mzGyQgI7vN+bBR4nYL86+sQ+XsZlg1GRE4mPMp3l+2Gii
	BgePKBrS8OTuzn64dWHsflXxKNi9+K7VeGLAaEmeFTs0DE0O4anhIfme/n26jNcXdg7LM2/rsz4
	SrwHl1/yfO4qqJcbvQ+MO8XQWatLuiKtAY2Lzxyus1xYoYCv8DzZvSAtPqOpnKuhCUNAuhbeZ9P
	oxIdM4pdl6AgDCv3M6nEt/I7tvaNAKLyVi3tZ+aCeEuhj+l5xTZtMlsj+BAb3alhrz4b1/99AGV
	UXvY6mgeyPJq0UIQ5L73PISjEWwfYJp6CtMam+x/TA==
X-Received: by 2002:a17:902:fc48:b0:215:58be:334e with SMTP id d9443c01a7336-21f01c4eb89mr55640625ad.10.1738689596275;
        Tue, 04 Feb 2025 09:19:56 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFRaCeaMYXzsJO4HcrPp6hyYPtN3U/0bZWJ5AtJlfpWHpm9+wpQl9q/SqVGNSCZ/EY68GmdAA==
X-Received: by 2002:a17:902:fc48:b0:215:58be:334e with SMTP id d9443c01a7336-21f01c4eb89mr55640205ad.10.1738689595879;
        Tue, 04 Feb 2025 09:19:55 -0800 (PST)
Received: from [192.168.29.221] ([49.37.208.137])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21de31f7020sm98411245ad.76.2025.02.04.09.19.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Feb 2025 09:19:55 -0800 (PST)
Message-ID: <c032881a-153e-496f-bea2-0eb8452ad495@oss.qualcomm.com>
Date: Tue, 4 Feb 2025 22:49:52 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/8] wifi: ath12k: handle change_vif_links() callback
To: Nicolas Escande <nico.escande@gmail.com>, Kalle Valo <kvalo@kernel.org>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20250204-unlink_link_arvif_from_chanctx-v1-0-675bd4cea339@oss.qualcomm.com>
 <D7JKQ60C6EZA.24H639LLIG2U7@gmail.com>
 <076014d2-eaaa-44be-81fc-a8f1eb0c2ac9@oss.qualcomm.com>
 <D7JLLQ79FP2Z.2Z7VYLSC52A2U@gmail.com>
From: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <D7JLLQ79FP2Z.2Z7VYLSC52A2U@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: -lvb64u4pSPo96v6B7bxTm4k4poL-cBQ
X-Proofpoint-GUID: -lvb64u4pSPo96v6B7bxTm4k4poL-cBQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-04_08,2025-02-04_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 bulkscore=0
 phishscore=0 priorityscore=1501 spamscore=0 clxscore=1015 adultscore=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0
 mlxlogscore=977 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502040133
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250204_091958_960931_4C53CD0F 
X-CRM114-Status: GOOD (  12.60  )
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

On 2/4/25 16:14, Nicolas Escande wrote:
> On Tue Feb 4, 2025 at 11:23 AM CET, Aditya Kumar Singh wrote:
>> On 2/4/25 15:32, Nicolas Escande wrote:
>>> Hello,
>>>
>>> When applying this series I am no longer able to start an AP on a DFS channel.
>>> (I don't know specifically which patch though)
>>>
>>
>> Thanks for reporting this. I think non-DFS channel should be working
>> fine right?
> Right non DFS channels are ok, only DFS ones, and not from the get go but after
> the initial CAC, when they switch to operational mode.
>>
>> Anyways, I'm able to repro the issue locally. Let me investigate further
>> and come back.
> I'll happily test what you can throw at me.

:)

I have posted v2 [1] fixing the reported DFS issue as well. When you 
have time, could you test and confirm? Locally I'm able to see 
DFS/non-DFS working fine now.

[1]: 
https://lore.kernel.org/linux-wireless/20250204-unlink_link_arvif_from_chanctx-v2-0-764fb5973c1a@oss.qualcomm.com/

-- 
Aditya

