Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42950106FD6B
	for <ath12k@archiver.kernel.org>; Fri, 13 Mar 2026 02:45:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fRAKzLrTUACG7+9Y1arYEb3137UjTwTGDq/sWJpNAI8=; b=tarIXVHAzHnUwTG3rU47La3Nkw
	FqNRzwfhFh1l4WhECqR1PNSpUzCSM57ddWjO8odUxDGxgt6oGPSNeYk/zPZ0amwlNecZWIe5O735j
	L3Yhjbc+JsqQeT/Ck/x96OWe7lvHc/vltu07jdj2GjIfoOi9aEfQDwSs8a7TOyMLoIQI7Be2j3FAd
	DxMcrqrA3fxJw4G4Rs3lthinW3tKUn8wY85nS1HcW8b+faY4JnO0PseOiv7iZaGaPX+itVp8N/Nyy
	GJB1gjWA5UIZVcACednizIALkswi2MUgFfljl9/MEoXd9jahA/sAmw1o8ruJE7ui9WCh7TENTYT2n
	MQhLH4lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0sWO-0000000GHXt-0exf;
	Fri, 13 Mar 2026 02:45:04 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0sWK-0000000GHWO-3O6y
	for ath12k@lists.infradead.org;
	Fri, 13 Mar 2026 02:45:03 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62D02mxS1594015
	for <ath12k@lists.infradead.org>; Fri, 13 Mar 2026 02:44:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fRAKzLrTUACG7+9Y1arYEb3137UjTwTGDq/sWJpNAI8=; b=HJbRNwxaSht0Dk22
	TfShIPbO79ZK3o9dfg7GovCtsL1sB8V+w1zrS6fZ48wzGXq8DBCUNCehO3ITYGt8
	052HTH88TKahiTOmMvtMSfvLNCLFvTyGqtLL746TiZq4XcxRZcpSTApyNTNczWbO
	ZL3np0Jck6YC/6E58T+MxxbxNensbAyYLFhjIPd0TfY3ZZp6W+ItKZV+8IKH8vb5
	zqQM7Nr9uEAPaXKSbXUhrNp4HdLtT0RfxpcAD5gNm434XKI8qM46q3opyl5K+6Ey
	BrUMw3n9Kday/Hpc3LFb/W/l/Yn09jynukMa5RI+5U3cCqegE5Fj7OJYbXjC4F4O
	cQNxNQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cumvqbkje-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 13 Mar 2026 02:44:59 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-829b6b22dabso684028b3a.0
        for <ath12k@lists.infradead.org>; Thu, 12 Mar 2026 19:44:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773369899; x=1773974699; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fRAKzLrTUACG7+9Y1arYEb3137UjTwTGDq/sWJpNAI8=;
        b=XNBBW2ab88vDA2zqERgGJ8SeDhf5kmHMFDJHBH++fOP1C1GLp7jYTWFghI7i2rC00U
         +BPPRU8Yb8zOXK/xatF0pI/Fl+L4AotFXfz9g//7OU7YBtT8N2xy3J5epfn8SX41y+kN
         uHbcaXaWG0ueKlGWDbZtE7JkeWxBNvIMPPm1FCMoVsWAyALSXLr86ce4IL4cgyAZyw7S
         Omuxl+kppU2p9V2XxySd9R91JHIxDabvMgS2+g7FjZ721+UMhhlh7AK5oe8rUexkDQVM
         P68OK1WMQja5KGCTaiPXyWUISyxJa3Z7tOa7sHjT8mSicKuF6GED6P2mNBbWCXU7/3Yu
         JoOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773369899; x=1773974699;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fRAKzLrTUACG7+9Y1arYEb3137UjTwTGDq/sWJpNAI8=;
        b=MilSKk2kKS6S4fcJBVxZTdl5QaZ1ObB6vKIPLNDKsjKCx2vo2cWvCnE/lYbybV9LvI
         r7FrhFc0vvilwbUp9ulvS069oNewhgnzETN2PHMtUg0emgsTjb0qRDkDacdAPei5/sV5
         CpXTcoX1KbuNt4gAjCDSmYQrQF4+B1nrVJWOPrCVubnBRp8CVVsLW9+TiQEJ1LIV4XHI
         25x916yTvlJKDADeEP292o+7lf+hZ2Oewusf8AafQtw4eah+SfSoJmJf6u0KffeWAqiD
         YNlH5DZsYJL0tcuLn4hxhknsBPcNcZ0TJS2/2aW/i+QvK9TlLgbv6kFrGDuLjMWMFXE2
         LCIg==
X-Gm-Message-State: AOJu0YyGPR+3hbHDkNUOq9s3GF83aL7XVAYcQSpTUi1qsjWtQ+sHYKmr
	7e3X/yCChJVVhQewCrwuAw419uLxbkNiNAlowirmOm8lwYxH6fxBU6DiyW+zvl6OyjEynfoEi9B
	UsuPqvxaRNL4ct6f+lC5bKd3hTApSRlsTsrA6IT4ebjCKkLVItZyG4Im5ahMsVswv4ynHrRzOjG
	0=
X-Gm-Gg: ATEYQzxgLxmdKkfYXyqQxyezytMZO7+fe4Upwpz3JlZYCbbOzdmIEty3CYH1x5/Kfgq
	UPKeqST+AHmGoil4LV4APgZpyrTV92jHjh0NCFRpy7MwEm55EcCLQ1rllPPKnFLQ2e7MacuMBnx
	nDLzGp4BsOZTRcZ+j5DOYRgyF1HOCCJ5OpfbMQB8QQFT64MqypDI8ICuD783129xoXqC2aHX4vC
	c1bupVDxAyoCmL8d5Cnjg1Y9fo7IsBEHL++twhimT/WFFy9fXnZZ30Bbs/3o7x3vP/D79Av5ldY
	V7YS9Qy/1WhR2WR9N2j87X1UsR6XVaJosItfoHzxs+GNaloWFiAPAMYnxYZsyayYEAx4FGSa/SM
	A+l5P5+XVBP7JFZK5vcSFMeDimirQf00B9mg/d38pn37HgGpPiY1dNFf3BQBUd5QwUYZJUbLj7O
	Cf1qe/F5weNIsasvb0jg==
X-Received: by 2002:a05:6a00:909b:b0:829:803e:6798 with SMTP id d2e1a72fcca58-82a1990205fmr1198294b3a.56.1773369898705;
        Thu, 12 Mar 2026 19:44:58 -0700 (PDT)
X-Received: by 2002:a05:6a00:909b:b0:829:803e:6798 with SMTP id d2e1a72fcca58-82a1990205fmr1198279b3a.56.1773369898268;
        Thu, 12 Mar 2026 19:44:58 -0700 (PDT)
Received: from [10.133.33.71] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82a0724407csm4196019b3a.8.2026.03.12.19.44.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Mar 2026 19:44:58 -0700 (PDT)
Message-ID: <6948d3fb-d3aa-47c8-9a40-4ad8e3b72ce7@oss.qualcomm.com>
Date: Fri, 13 Mar 2026 10:44:52 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] wifi: ath12k: fix endianness handling for SRNG ring
 pointer accesses
To: Alexander Wilhelm <alexander.wilhelm@westermo.com>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: ath12k@lists.infradead.org, linux-wireless@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260311102416.224621-1-alexander.wilhelm@westermo.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260311102416.224621-1-alexander.wilhelm@westermo.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: aN8XWov_Vssk4E3dJs2DWcnvwD7JgTLm
X-Proofpoint-GUID: aN8XWov_Vssk4E3dJs2DWcnvwD7JgTLm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDAyMSBTYWx0ZWRfXzcaPeyWs0ZGU
 hwklA1oVXinxajAeP5bnBB1JYajMsgazb3XztJyAPP8j38MOtHFWjZCZvewJD40aKWfuyXVrTlO
 VnME3CssHCVqTXXs80x+Iff51UimmDPuNtHXXPO4pCmnaL0kqWvj+8htqYE6YBtiNm1q3E3zKtm
 Ar/Iy+QsnjK3B2pZBbj63ixemePdOIdUqJsgzGXUMY0o8LzvXoBWA2Y/31gDLjOQe+m8Ix+gJqp
 flErMHSGcNLFKvYXQyfwF+nY+37ams+tfWNqOXSug129vcWTzkMqDIq7HK2lRJV8VdjOCZmD40j
 2p2OpP8znhnO7eoGgw7a45j7UxZOISOUiA8LrcAfPTGi0zRCKlI0jNHz4pAwLzlu1D0AfnbvAlv
 S1e44nFrAJx7mmMQcdE/KNnVvAN+YqTx+A7Pwf1Hj6+ifXAjuBnTeDN3Vu0uB7q2Lzb6+V6iGnd
 LLxdDXwm7MlqGsBazQA==
X-Authority-Analysis: v=2.4 cv=ccHfb3DM c=1 sm=1 tr=0 ts=69b37a2b cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=N9GNhs4bAAAA:8 a=EUspDBNiAAAA:8 a=mClSoXhwh1Xnl1UuZHkA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22 a=PZhj9NlD-CKO8hVp7yCs:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-12_03,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 malwarescore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 spamscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130021
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_194500_858953_ED2DC670 
X-CRM114-Status: GOOD (  13.63  )
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



On 3/11/2026 6:24 PM, Alexander Wilhelm wrote:
> The SRNG head and tail ring pointers are stored in device memory as
> little-endian values. On big-endian systems, direct dereferencing of these
> pointers leads to incorrect values being read or written, causing ring
> management issues and potentially breaking data flow.
> 
> This patch ensures all accesses to SRNG ring pointers use the appropriate
> endianness conversions. This affects both read and write paths for source
> and destination rings, as well as debug output. The changes guarantee
> correct operation on both little- and big-endian architectures.
> 
> Signed-off-by: Alexander Wilhelm <alexander.wilhelm@westermo.com>
> Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
> ---
> Changes in v4:
> - Rebase on latest 'ath' master
> - Remove volatile from `hp_addr` due to the `checkpatch.pl` warning

by 'cgeckpatch.pl wanring' did you mean below ?

"
WARNING: Use of volatile is usually wrong: see
Documentation/process/volatile-considered-harmful.rst
#64: FILE: drivers/net/wireless/ath/ath12k/hal.c:504:
+                       *(volatile __le32 *)srng->u.src_ring.tp_addr);
"

But the documentation clearly says that the case here is one of a few rare situations
where volatile makes sense:

"
  - Pointers to data structures in coherent memory which might be modified
    by I/O devices can, sometimes, legitimately be volatile.  A ring buffer
    used by a network adapter, where that adapter changes pointers to
    indicate which descriptors have been processed, is an example of this
    type of situation.
"


