Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97439FF8867
	for <ath12k@archiver.kernel.org>; Tue, 28 Apr 2026 02:42:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BDvh2V5ebRZJ2XFlCMmuSuMYlpOsf9xu6saUuAb2a3w=; b=msFjQm+dlr0t4dFKv8/Bh9BdF7
	IXO8nDorbc2g8BJzGuFAGTO0F3H4aDbKir0xSCurabP7eDwVk8v/4LXvEcyZi8/haTBqDZk3qL6j1
	K92qWzjuSdRS41lNtZ3v9iXV9ETWhv4ZOKIlDRMZv/Pq7irQDqI/NG/xunNd0pPLaIgF04JyUahR5
	bMPEDy/eQhnXdGMMCfnE2szYeu+rcB1t7GOxdma0wVH3ZVn2z7BtmFoyaVyWXfo5gr4hXdrY8RGWN
	9OFAdCcmGFJiJP7vx3ynewpiYS8LIY2l17cNxJscgMbbsneFTIM0rdcyCFv8BFe6jsb4+GGufZbl8
	AkMR7BvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHYPC-00000000SZD-0gAN;
	Tue, 28 Apr 2026 02:42:34 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHYP9-00000000SYN-47Vj
	for ath12k@lists.infradead.org;
	Tue, 28 Apr 2026 02:42:33 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63RHNtl0663183
	for <ath12k@lists.infradead.org>; Tue, 28 Apr 2026 02:42:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BDvh2V5ebRZJ2XFlCMmuSuMYlpOsf9xu6saUuAb2a3w=; b=LbNnZihdOrXJJ8Ki
	viJl75+jw7bD41rpQ9B+4HkKwNClAH/5A5piefJG/TNvsIgPQmwBi4HSNVZKdAGX
	XmNJak7VgQICIF7tCtYumsSQFFvxIKQxdFfk0qxyPPp4LBjZhCbOtknCNuilhQDZ
	seUiHwA6/x7myVvQaADPPBy8a2npqfj2wyRa9MaX/vOnJThufUuXcZGTCxZrx1mt
	WwdLv0TUjYt6LO0TpmV6dRt+oYpwKvao68kOMCIOkCdB6MoGdXIkElEzLEX5VJ6w
	UKlcXQZQSHdck76UhUr9uKukx+qmE2DNKQAheXuri7Xrwj6zptWVwROXwHDsmtk4
	Ufh79Q==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dtc5n1ssr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 28 Apr 2026 02:42:30 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b454cac322so103507815ad.2
        for <ath12k@lists.infradead.org>; Mon, 27 Apr 2026 19:42:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777344150; x=1777948950; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BDvh2V5ebRZJ2XFlCMmuSuMYlpOsf9xu6saUuAb2a3w=;
        b=kiNy9EMBCIlqnK5ofZHocJj47BBfODwW8fIJ9+kBNzHYYFGWIkfY8Gln8mkJotfxlH
         phUr8Y4E0gGVMOswp7Mi+QES0hEj/lfdcw/WsxLomGwWlimI/l4tVqLL0IHST8uV49UE
         JivjRbMMJKVKC7k7L7i8JtgcrSJ/3aEKQTnVRghlSw6qUFxFT9iLJgvvSKue2W68X73K
         AyYnNsqnzFZb46+j6rUC8JChx6v+djrleqr/ABid0HiPHd3vKUpsnw7a1C4feWuamERa
         IG2NCDhNbFftGjQx2hqoigKNLgB1ZnnaAjE3JGNqqISilMpn9iOlY95yrACUUFSQZkRy
         s0bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777344150; x=1777948950;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BDvh2V5ebRZJ2XFlCMmuSuMYlpOsf9xu6saUuAb2a3w=;
        b=VxVspCLQUcCCb8zMQ07nNJQ4ivANzVJ+Y/YQlwWC8y7IeXsWp3BhvWYXBYovMv/EUZ
         m9B6vXvuNTvbfluksaSbf9IsnZibHkXvSwavFlcLimSR8rbLh65SuOVmKp2t8JWAoY2o
         IeCDR4kYNCL6WwM3k4qIxDtNnH2w+pYICyL6lEX1ifNRnP5lw2RmlSq0LYhOFB5CmDuw
         GvhkijlQMYG35cVFoCbVD8h2A3ZohelrWqEqYyZ88YIWkRWSyG0iP0Ts48WxCtHf+laV
         77rO83H71Mz/saZNYHO8R/daOzBDrBGpAybgQmO+WjS+8eek94YMSLW9mj3IYcZfkFOm
         vyAA==
X-Forwarded-Encrypted: i=1; AFNElJ8waMaS6aC2CkaRgMU9PiMHZ5+D1iUdGe6f3vYh1JEj/bqo8M6ECYOv9F73ckLZJ9L8LuQwwl4=@lists.infradead.org
X-Gm-Message-State: AOJu0Yxgwlgdr8hYKzUOqumkyOQ3oNSH4M0JJg6OYu1mpQnmXCP2f+uz
	Rxr2FBjZsDWQJRaD7Y6xLpjhlhOmcrQ6oSpW64eizFkTR6wjq/xfjGw4FmrPukU4PW0w9KZUeaV
	HBHXjzocSO9IKaJJUPLwlXAA2IcECR2ugyKr9p7ZyN+EUIWETi/yHcZAYqHWijDlN
X-Gm-Gg: AeBDiescvHn3YZ2t58aY+emRwZksVqSXMmTXm8pa9KSivvSI9L3SEM4sQwkbHSpYVXi
	HKFRTgtMVb443R4OlGnzSFl6sp7lAxAL3r8Rxzy0UbzNZpzaNaNehDTo1qrAwaNxLWyEidBQeas
	X2cRZIczhCNZ6Z+BginwgEhGu6Gx0G/twsXUBnajaz8VDW0j2A8hR0ejIlqCWMKNME0ultiwyhB
	ByewUTo5vKvTw1y4cIqX8srmtCIg63n0qlsV+ed+vTvTAXZdPLD2/s6vj7O/o858154b85m3hJd
	4E647TL6qTuRKq6MVzrfmLV7CoTjJiqSW0R7zB87uTFHq93TWSyD1R0wEp7UOYD5X4/5I5m6gwg
	dYNJQbuGbZcFLrnYMw+8yeu64gO4pF+rbTUWviXEKNajkUs4sDP614WXpvTikOz7TCeBtKreUkw
	xCzR/6pGBI1j7kCoOmATEvRFvlZ8Qm6w==
X-Received: by 2002:a17:903:1107:b0:2b2:6df1:111d with SMTP id d9443c01a7336-2b97c461dcemr10475345ad.21.1777344149795;
        Mon, 27 Apr 2026 19:42:29 -0700 (PDT)
X-Received: by 2002:a17:903:1107:b0:2b2:6df1:111d with SMTP id d9443c01a7336-2b97c461dcemr10475095ad.21.1777344149276;
        Mon, 27 Apr 2026 19:42:29 -0700 (PDT)
Received: from [10.133.33.153] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b97acad206sm8469265ad.83.2026.04.27.19.42.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Apr 2026 19:42:28 -0700 (PDT)
Message-ID: <7867ada0-5156-4b0b-8668-174ff0629424@oss.qualcomm.com>
Date: Tue, 28 Apr 2026 10:42:26 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next] wifi: ath12k: unify error handling in some
 ath12k_wmi_xxx() functions
To: Nicolas Escande <nico.escande@gmail.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20260422163208.3013496-1-nico.escande@gmail.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260422163208.3013496-1-nico.escande@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI4MDAyNCBTYWx0ZWRfX3aulR3fLTzue
 CPoLVX8NIzCXBdNNgO4vSFcw6aG72iazLQDBlgGxC7zdisS8HiPCKEfciweprVypmWE0XlddQqI
 4F9KMHiqcaIm5DwoIN/z5/mLbUg8lBOaTijHOu8L/ZKwuDJtIp8xSRdjMNetLtxWGrXXDjNDQLX
 w4fdMbMROkHQpPhX18ipcpAnJK6PvQIGc0sF3xJ1TukZKKbHgyw6gVoyJfZyqfEswMcqScASTYJ
 iIfO2SHpKFKxVAG7kTtzAc3yh52nVNpaBzYfVMEiGQNYkruDmDWIwR/uuC+nFCqzJz4Wkq+JiH6
 5sN8Clew5XhskvUGqJy2yoxEURcrYuBtAAM+w9NVMNQ1EbF2ABIfty5bxlc0e3QNL/t4Y0u8TWg
 P+ARWTGjmBeJwoGuK0qpXxtjDk28abHIVsxNb8BLgz1RK+EGdNvgQOQnL2jaXPjjMXBs2fpfw4H
 HTra3Lcuv36X+FF1xKg==
X-Proofpoint-GUID: pgIH06fOaKvK0vkqDZ3ELFwh--5ZrZZy
X-Proofpoint-ORIG-GUID: pgIH06fOaKvK0vkqDZ3ELFwh--5ZrZZy
X-Authority-Analysis: v=2.4 cv=ZMfnX37b c=1 sm=1 tr=0 ts=69f01e96 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=KE8VTcUQ_TpmJMKzUYYA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_04,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 malwarescore=0 adultscore=0 impostorscore=0 spamscore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604280024
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_194232_139897_B8AC6A7D 
X-CRM114-Status: UNSURE (   7.32  )
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



On 4/23/2026 12:32 AM, Nicolas Escande wrote:
> This is purely cosmetic changes that simplifies & standardizes error
> handling for functions that ends with a ath12k_wmi_cmd_send() followed
> by trivial error handling. Saves a few lines of code too.
> 
> Compile tested only.
> 
> Signed-off-by: Nicolas Escande <nico.escande@gmail.com>

Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>


