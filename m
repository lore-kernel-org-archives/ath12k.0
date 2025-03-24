Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA50EC36002
	for <ath12k@archiver.kernel.org>; Mon, 24 Mar 2025 07:30:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HJ8685mCmgsitSKIEUunf1oA3s66xel4PR1PeM1GFJ0=; b=PLlbSXgXH/uaYRfu8dV6H0CfxA
	pRKkbNaPnBDCvRMNyLuAAbDcP/0ljdMCBrhcMxYLlst8FpV4vcUw/bJW44TN3vOy0vSRj03gsdzv4
	TR16MGoQ+3fOB5bvXKXUFlSYpJU+9bQ7KVc3IjAUbI1JWbbTcC4/N8QIf6XvvFsIL4bmWOG3jZIeY
	BlKm1CFtKUMq7XxekowoRKuYa7yrn5hS5coU3e7nMdWf2YkNLB9ZrCiTuQLQpNp2j1cnLAfpZSfp6
	qICWh83BZUrnbrlGS1hqEo9DwySdgZy1tHdwGKBu+7LspQHKlkG8Q2zwElMEmAEDNK0m7Iax9PxY/
	KXaf7J6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twcGh-00000002SAy-24FP
	for ath12k@archiver.kernel.org;
	Mon, 24 Mar 2025 07:30:43 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1twc7W-00000002R64-1U5J
	for ath12k@lists.infradead.org;
	Mon, 24 Mar 2025 07:21:15 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52O6cQfY023074
	for <ath12k@lists.infradead.org>; Mon, 24 Mar 2025 07:21:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HJ8685mCmgsitSKIEUunf1oA3s66xel4PR1PeM1GFJ0=; b=XQhiXis5GKV6C16X
	JbS8qaaECp1gX+sun0SrsPD482pp8N4EsB89lAye1zoAPoe77E73fIKVGmZRDDF0
	s5+9+aj0qYkxjMaV8+0j7eTq6LxXNYImbYzB0TE0L8T+23MBYVonFoR3yAz1qVvK
	h7hmPj/gURjnu6/IeMX0RZBqHr5CtR1YVCZOFr9xFrhqkvoAvT1l+aMwJdtY7mbq
	D2ZCksdizJvVcErvJtm9Wkc+amJlLdeIseUW9M9ffb/hLdRmZ2iByySfNvwV9btU
	6IRQ++N/1yIWg4QTow8EDksFKWD6ndPmt2z634aP9pFmlxbiiYdoa9rNYAccNl3v
	uP7JIg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45hjwhkk9g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 24 Mar 2025 07:21:12 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-223fd6e9408so62263815ad.1
        for <ath12k@lists.infradead.org>; Mon, 24 Mar 2025 00:21:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742800871; x=1743405671;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HJ8685mCmgsitSKIEUunf1oA3s66xel4PR1PeM1GFJ0=;
        b=hwHl2BBoucX5IxqgGE3tVhYouvVWdABNyJGobW0HaO/kT1AlZnLDWAG7z48HSMla6n
         4wnqMnW16EOkjKth+2GVHnW1p96snfj24KMmDWOEC+6nDr097jHY53Ph8UHc7I2awGi+
         hzStgDwgurnd9GsUfRIUrfbaPwBesj+AJeEVewsouuC2pX3tt7t7R3uSfmb1cw9XyOQ6
         WaFFzMlHN+GCY8PcoVpjcgyUy1DTsavL1UkGpU8NkGWEQWmaKMFaUUguBdYouxCL2J3c
         4LBjiPUhevJX+azo/AMxAE+DFEqb5b37GpI0Ng71hXxukxKd/V37rPdX+iW9UZQexlaZ
         clkg==
X-Forwarded-Encrypted: i=1; AJvYcCVYIrkApktNzBnnjkSo8Y6lAuIA2b/UUHadXOc65D1xHk6r41KdXaRHcEO0/Ldlkr2s8eINXfs=@lists.infradead.org
X-Gm-Message-State: AOJu0Yzd/W24MeCsRia4WhtRrxijcWtLmF8KZcmkGsbOVR+BAE6ZLDzx
	Nbg3dRxb6Q1P73/7g4AbTvvj2lWyhe9T/uywU7KGgP/DbK/aVnWPVjG78/Bip3eZeai2GAPzFpI
	lmTIVnPIAS6Qa+pTof1LOWB89oeDAwEXu8xWyQjxQjibdXMo94D0l1FGsEgWJxdBwR34j
X-Gm-Gg: ASbGncuUIlj3+go6gBVQdEXj+O02s68JyhqZJc0w6/K2XNY51VMO/DXrC9bIuEzHsdd
	/Fu3k40X4BDEO2gDe0x3ycsL0Qk2kT3SiH3qpvuX1bkGEBMAe9oUgoldRTM4+lTncfc5pGhL+CN
	Of6mB08SDKVFrTHTO9R141R6+x43aRV2A1ACLu9K/vXNkMdwP5XSzWh4KAF2aRHMLDSQPHF58ac
	CMM0dMho+tNkYVoMDYXhtF2oMtoggcIbCSYwEmlDt4ROdJm5+m28L0Z16b2uXLU6V1PTxSkY8Ir
	1bLD1AZCbuMkdRrhDaG4MlyMeHakrVuhBxb2xGAdz83fSw7SkPTEYvxSZPsrwaY=
X-Received: by 2002:aa7:9a8c:0:b0:736:4c3d:2cba with SMTP id d2e1a72fcca58-7377a1b1965mr26587290b3a.9.1742800871364;
        Mon, 24 Mar 2025 00:21:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGqObw/iye2SAF7GUJa02kgdBGQNx+DF8iOEAXtzsMe81ACzu7mqqP9GDJu4G97SKez+5thFg==
X-Received: by 2002:aa7:9a8c:0:b0:736:4c3d:2cba with SMTP id d2e1a72fcca58-7377a1b1965mr26587250b3a.9.1742800870665;
        Mon, 24 Mar 2025 00:21:10 -0700 (PDT)
Received: from [192.168.225.142] ([157.49.235.36])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af8a23dc8e4sm6457091a12.0.2025.03.24.00.21.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Mar 2025 00:21:10 -0700 (PDT)
Message-ID: <30351fd9-3fe5-359e-de71-22575c4f48cd@oss.qualcomm.com>
Date: Mon, 24 Mar 2025 12:51:06 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v11 09/10] wifi: ath12k: Move to NO_VIRTUAL monitor
To: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>,
        ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20250324062518.2752822-1-quic_periyasa@quicinc.com>
 <20250324062518.2752822-10-quic_periyasa@quicinc.com>
Content-Language: en-US
From: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
In-Reply-To: <20250324062518.2752822-10-quic_periyasa@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=H+jbw/Yi c=1 sm=1 tr=0 ts=67e107e8 cx=c_pps a=JL+w9abYAAE89/QcEU+0QA==:117 a=P3F+j+0UjHwaDtf4GQVMUw==:17 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=R3Fj9Vh-w1QtjPU8CJIA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: iAY419p9cSNIo4NTpLgfBGNk4QUZBC9i
X-Proofpoint-ORIG-GUID: iAY419p9cSNIo4NTpLgfBGNk4QUZBC9i
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-24_03,2025-03-21_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 suspectscore=0
 clxscore=1015 spamscore=0 impostorscore=0 bulkscore=0 adultscore=0
 phishscore=0 malwarescore=0 mlxlogscore=999 priorityscore=1501
 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503240052
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250324_002114_426838_1A34E8F8 
X-CRM114-Status: UNSURE (   8.59  )
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



On 3/24/2025 11:55 AM, Karthikeyan Periyasamy wrote:
> Currently, VIRTUAL monitor handling is present. In multi radio model,
> VIRTUAL monitor is not suitable since each radio needs a separate VIF and
> channel context. Therefore, switch to NO_VIRTUAL_MONITOR feature. Remove
> the monitor_conf_enabled flag and mac_op_config() handler as they are not
> need for the NO_VIRTUAL_MONITOR feature. In NO_VIRTUAL_MONITOR handling,
> each interface creation/deletion triggers the mac_op_add_interface() /
> mac_op_remove_interface() callback. Consequently, remove the monitor vdev
> create/delete/start/stop from the other vdev type handlers.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> 
> Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>

Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>

