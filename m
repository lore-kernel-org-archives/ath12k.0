Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D624CF2579
	for <ath12k@archiver.kernel.org>; Wed, 19 Nov 2025 04:31:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CpOQmT8J3EsyDEVDiu5/ZLBm5w7Agm3o05e/oikIxe8=; b=uoQkph76MxtHzCiSc/yyGZOxND
	2zeKua30kKZhWsuobB302sFqagWEs+2OG6NiijJVehRvvDOHNYx9GEGvrmPvx9rjl76K9BmFeNr5K
	dJSoo33R5+nRkkigj6UHYD50CuyYPXPI37NMfoEOe9iRzShuzKPaaKLxgrMwm1Li3C1i9oS4RaTkL
	9Z/Dz3m3t1U1hF0NbpBiZWdr8DuTtvoGMqMgqswR5NllNJYctzO5/EGkiXRdoGwhJ5TteXcBgLk+5
	MOxrS0lbI7Q2pVX8R4Sj7dmdsVscSpqltanGEmeaJeBTORrx21iVtobnD5JUuF61hPDCOAkFj6ltI
	KJIT0lVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLZqO-00000001mDR-49j1;
	Wed, 19 Nov 2025 04:31:00 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLZqM-00000001mCU-0GIo
	for ath12k@lists.infradead.org;
	Wed, 19 Nov 2025 04:30:59 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AJ12FCk3412656
	for <ath12k@lists.infradead.org>; Wed, 19 Nov 2025 04:30:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CpOQmT8J3EsyDEVDiu5/ZLBm5w7Agm3o05e/oikIxe8=; b=KrA+NpPwm4xGu7Cy
	JPexUd3X45d7bc53HFixB/DcBXlLYVUzxRn9zvu6j7ShP//jRGeVh2Oh5hces/la
	TeV2YkWFnC0U7nIwlmH6+79yLiP1d8BHD2fo6gpK6iWd3SO4DfyuTNJ7noVMT+/z
	VtFIZGnw+R0EofCBYVQ83HTi4YOa5TBDy4VRDfDUoIezEIo2DKtaLB/dmUSo94F1
	jDxZ+/tftIEZOvntk5jfkwLXeeQJxdCuUZPvx06/Y+YArIqsHVOYW2FYOnw4Syq+
	qdyTzWUaYC8ZE10j4QcBN+a6J+bLmvmI4/LMV9fYrKfe94WvtQT4VrLVmhmMqZjc
	yBIsPw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4agv0v1wtg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 19 Nov 2025 04:30:56 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b55735710f0so11249041a12.2
        for <ath12k@lists.infradead.org>; Tue, 18 Nov 2025 20:30:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763526656; x=1764131456; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CpOQmT8J3EsyDEVDiu5/ZLBm5w7Agm3o05e/oikIxe8=;
        b=VEBEnEuVYI+gAZAFJ+1Qukv1GhlLxrfQEow0oUj1Tq2+/8n/KweEy4xwxyeKMIpymN
         wu8bBlKVYFEmqWDAqKWB4Yy569qAd/EEht+IFh41cFLBrMWSJnJy2GOBR9JmIr2SX+mh
         qfrp839P3BNhhn2sQDrFR5J0RZxpokkjCwL2jG/8ZQ2coM1vXt2drTtO+2Ih2YGacoEV
         fGhsATuPqNbL48qAOFQ7vh3EPtIlGthz2xR115SFcQaEekvL2x6/eIJmitLrIaTlzNjd
         XaLgAbu8ZWEQlPsUm4vSMWMwmcrasp4X7l/SPj8EEZThbi1n580axcdrd/EnRDWMQnw/
         kvmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763526656; x=1764131456;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CpOQmT8J3EsyDEVDiu5/ZLBm5w7Agm3o05e/oikIxe8=;
        b=G2d6xZEsnKV7YXBft6VAjAkDjTx/p60Q2ERCOlpxcLWCoAwAjF8sw5siPvAfkJq6Jp
         PndiFf9rxNex74dTFOr1ryQW6VidEuuTymHrLMWTx4qaLIutRfYvBLM8NJGukYpGjajY
         YR/hO+94klDfOT3E/SCg95ah74DVegj5YxlAkKoN9EPhedGpCTn8AaBA8/fopiG4IBnS
         un614MLIb6c953Tdqxz4HbEpbAPjuk8wCw0cex/xitMU47kwn57yjyRJF/fBEY7HKepb
         MJp3I7j9YkqtCRNXW97xW+Mvu/fU+TZPpRQBB71VN/uHEuNYKUAA6FMSsufnMpxNmbQD
         eMWw==
X-Forwarded-Encrypted: i=1; AJvYcCXUvNpXu1lFRAxLWcLnfjZSJNtwy1RS8ry4x5Ff2FclW+ell7Pl22GrvbBwl8g57SYWZyGqIQo=@lists.infradead.org
X-Gm-Message-State: AOJu0YzQK+iAcbx2B2lWC/HIIqg/N9ygJSCeCiXuY5hnhtnYhy4A+tzC
	F0RxtajNc6IMe8tgqDreTUvHuAM2BTxw70bJ/gyQVCcwHE8K+c1rDISKBPxYvGRgyeKwNUiZU32
	vuDtZwI6AJ+v+uTrXj3UIXMM4QgqCSuis4ipUwbCZBglRr/rde2srRqkUqMsd9QTwPLEf4FBB
X-Gm-Gg: ASbGncs1U26+aK4DhCjcD2D2E9m4LnTz+eGybUpW8+ex3T3RPmP3erieVsZyU+GgVI3
	w86h8mYY83IzZ4BevOh0J6gKDXXvb86ZyNbIto1UpfPx5NSPAORQDBZoMClhplKnM4OjVar51K6
	6/GLdvDoa0CRyDwOgYeW9qqFIrJ9uD1NvSdNkXkkoNTfdYUqJPN/yoiKAe6bbtscwTKj8ROpgcX
	jlPYOqaJ81CuUrRKEkwnO/5RHk3gG9N8o2E8NAGUdVrSfnyaoiYirC09ScSZomSmzDh996jXqq+
	v0ThhZTILM0zhEDrLTt7JQHpNuGPWLmgcNnlCcc/gzBSgIS+ejnuuQhOMCUX0Up7Flwx+Ot5F6M
	CmQEf6Ww1ZIIjXWbGHO+0w2Cm+XLPlgsiNTlvFw5G4VOc9RUGGVtMw4s=
X-Received: by 2002:a05:6a20:394a:b0:334:a11e:6bed with SMTP id adf61e73a8af0-35ba1c93c28mr23433634637.29.1763526655681;
        Tue, 18 Nov 2025 20:30:55 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHqvnlKNYrTT3W3dusgRQKlWabD4+oZueu/nzfzKdIecWx4tRyVqe4leh0DWSVeMus+8J1WjA==
X-Received: by 2002:a05:6a20:394a:b0:334:a11e:6bed with SMTP id adf61e73a8af0-35ba1c93c28mr23433594637.29.1763526655200;
        Tue, 18 Nov 2025 20:30:55 -0800 (PST)
Received: from [10.152.204.0] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b92772e7f2sm17902485b3a.57.2025.11.18.20.30.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Nov 2025 20:30:54 -0800 (PST)
Message-ID: <bcb98743-47b3-2aa6-85b8-1b485e8d5658@oss.qualcomm.com>
Date: Wed, 19 Nov 2025 10:00:51 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH ath12k-ng] wifi: ath12k: move firmware stats request
 outside of atomic context
Content-Language: en-US
To: Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org
References: <20251119-ath12k-ng-sleep-in-atomic-v1-1-5d1a726597db@oss.qualcomm.com>
From: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
In-Reply-To: <20251119-ath12k-ng-sleep-in-atomic-v1-1-5d1a726597db@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE5MDAzMiBTYWx0ZWRfX0rtefHZr0AHy
 +anIYkFQm9cGk53VFHk7urX6ieHAHVOUasN9kJKx+BOXeWIckq0hrqbj6oWUrPXN75Y8WKOY2zE
 NAjtWu+HVSGwBRrKqJGfp/qCpBbxg6kErrEFZJKe/xusf0D94UzCoflCWOlHVUDyTheK9k72StT
 YKsz5Rlojsw7CYWGOxnGAoulYZAlwI6Kp2WVBBAYydFR4B7UiaiqgDSMBM4PdrHiV7YhXgJ+wU/
 zMUMx1fMiKw1T3DuNG9s3Gp9tXj2JZ2+iW47qxd/GozkMWNsbsUPyxKUp6g8ZJNvs8zgKJlw6pa
 9jBCcbZH46ZS4Sk9BhGQ5Wc6XxFJrzgR1IwYaEgFtlKdCs8oHlp2uec+4idOBh60nW1gUi4Uc5O
 4bkYsXnL83a09TT84nOg46KQoNY7Kw==
X-Authority-Analysis: v=2.4 cv=S8XUAYsP c=1 sm=1 tr=0 ts=691d4800 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=OAyIG4kq6eV51QKt1ZkA:9
 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-ORIG-GUID: GA7Gu-1Ag_pbxsfx0kpQp5CNucJo3-CD
X-Proofpoint-GUID: GA7Gu-1Ag_pbxsfx0kpQp5CNucJo3-CD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-19_01,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 adultscore=0 suspectscore=0 bulkscore=0
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511190032
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251118_203058_226253_B9B05B5F 
X-CRM114-Status: GOOD (  10.22  )
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



On 11/19/2025 7:54 AM, Baochen Qiang wrote:
> In ath12k_mac_op_link_sta_statistics(), the atomic context scope
> introduced by dp_lock also covers firmware stats request. Since that
> request could block, below issue is hit:
> 
> BUG: sleeping function called from invalid context at kernel/locking/mutex.c:575
> in_atomic(): 1, irqs_disabled(): 0, non_block: 0, pid: 6866, name: iw
> preempt_count: 201, expected: 0
> RCU nest depth: 0, expected: 0
> 3 locks held by iw/6866:
>   #0:[...]
>   #1:[...]
>   #2: ffff9748f43230c8 (&dp->dp_lock){+.-.}-{3:3}, at:
> ath12k_mac_op_link_sta_statistics+0xc6/0x380 [ath12k]
> Preemption disabled at:
> [<ffffffffc0349656>] ath12k_mac_op_link_sta_statistics+0xc6/0x380 [ath12k]
> Call Trace:
>   <TASK>
>   show_stack
>   dump_stack_lvl
>   dump_stack
>   __might_resched.cold
>   __might_sleep
>   __mutex_lock
>   mutex_lock_nested
>   ath12k_mac_get_fw_stats
>   ath12k_mac_op_link_sta_statistics
>   </TASK>
> 
> Since firmware stats request doesn't require protection from dp_lock, move
> it outside to fix this issue.
> 
> While moving, also refine that code hunk to make function parameters get
> populated when really necessary.
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c5-00302-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.115823.3
> 
> Signed-off-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>

Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>

