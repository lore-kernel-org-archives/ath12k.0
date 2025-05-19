Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6E07C5479B
	for <ath12k@archiver.kernel.org>; Mon, 19 May 2025 18:20:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/iqUYcQ/ZKzUE0OzM5wAJzodMofqq4SZ0eyOXeP5OsI=; b=LNkN9jcsQ7bhBdlnrk8GYqUgIT
	YLTnT8W8PCgKgoCEVR+XV4KM9elmUfASU3eSVMfKYIkvU65uaqYm+rNC0wjMyDvpsFDglay6RdmQn
	dJhxtEphVSgU3/kns4l+GbIc76biBG/o3nlSJmfT3sFbAmLVXjO93qw4j+7Lydsvge77JQA5I4Lvr
	o23tHPDDRCSMZ8ZbkJPt/kyycK3lnkplLtSDJa2uXTd2qnA4dICkMuAMYd0Szyq+bXvooN8mko5ZO
	0HSXjppqarQ6qaq0BSlil1i3Q/97OvO/xwefsQmbJTbVbGuefvmLLQupRFLZ+i5SIOq78BLs0WdL8
	oRi2gy+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH56c-0000000A7kL-1Y0Y;
	Mon, 19 May 2025 18:20:54 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH4az-0000000A0wj-1oaR
	for ath12k@lists.infradead.org;
	Mon, 19 May 2025 17:48:15 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54J9a9GP030161
	for <ath12k@lists.infradead.org>; Mon, 19 May 2025 17:48:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/iqUYcQ/ZKzUE0OzM5wAJzodMofqq4SZ0eyOXeP5OsI=; b=nBAZIacEk1H+H/rM
	JhG2yO5ZBzJOpq7N5vO+eS8FI4zCu3ZVE1z3+ia5nfBp+7qBE7kwfBknYowPhouK
	ajPXRi0mJq97G6IjQJwhDRDxVxgiJpbNog01EZdV0xw3DcPfxFVp6aCDl8uLTPEK
	Lnf3iDrcKEZi3tPLCpXo5tTQRG0zfEBm12PskkkxZLHOa2srcOKujig6i1kKD7dk
	0oLsG/vMfG8BkrSDbicX4NJeYPPu0P7oqMMdhjDef7InmhiZ1gkho8Q89IG/MpOZ
	Hi4qsSXIMIy9JEasvSl0y1lcU3hfMYU84INVMYEAGZZshUhC9kuA1maawSYF0ZIN
	Fl0SRQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pkr9w677-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 19 May 2025 17:48:13 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-231de0e1ca3so27095075ad.0
        for <ath12k@lists.infradead.org>; Mon, 19 May 2025 10:48:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747676892; x=1748281692;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/iqUYcQ/ZKzUE0OzM5wAJzodMofqq4SZ0eyOXeP5OsI=;
        b=nIr6IUevWl6EQaEBg+mjv+TLnLmHJTaZXRLxPRKOdXPVc3NsNkBFnl4ZmfLsoaM4zz
         0qosupIo/5AwKZhVZDXmyVhjbNK2Vvx6bFCb5s/UND8Yl9js3srnEr4jb7VYuBFLh40S
         UJlJKvsyyfk/w7Hzlpg9DgmYH36SnNcZNO6FV+jLyxGDmJiBiKatrnARIvo/dQ8iQ+xi
         /Raj4oGxTPtg9lnLZqZL8zyrbDyR77h7aFV1Yng+s2oBiybTx+RXZxlVMgixCDsjWNkq
         Lzi+jQM+7kkv6tnVRSzG+JzIwqJeMA5Q2ANcSlD/dAn7CEk05f1PV0IIQrlBt0q/w1vb
         zjPg==
X-Forwarded-Encrypted: i=1; AJvYcCWDWvx1sycxr9CfFdT5DbJMv8XzIhzJxchG1lAKKEW5b89126EfYt7pKqcxFdyCAJ7UH/NUWJU=@lists.infradead.org
X-Gm-Message-State: AOJu0Yyj3Avbv5XQaUE2QeO9hyFY9VDBNYQdSOV5Ngbvklzb/KxhpKWl
	1ySX8vJaNkec5MWMzRxcpy1ciQU+FfTYGH2VWcpR42jQnXRVhlxZsSfMy+bKWgHU9du/yX4y1wa
	BJIETzU4bvEo0usLwaa6shkpgqy0rcJGO7d5jqQwd8ISIPQhPKCm8j52vwKrjSWt1
X-Gm-Gg: ASbGncuXxmtmydb+62qbhofs1el8jGp13QCK3fZ4euBTIxnmn827DwdLULjFx6xGDjN
	qJfHGtl3PoIk5LJQsXSi6A2oxFVYRFboV6r8yZinGTgmv/w814xy+n0Hoa6hdMUGbbzPxXElkGc
	2w6SBxiG0+XrnrftkWzMdjxeuSQt8pZsMHdXHLd8l2K6EiO60W8OOEq127yBFD5nXaiGFiuhE23
	+wd9yn487TpXQBaxjnIHKT+bZHg7ZZyolDTQ74SgKBX+624SDKq9Y/wpNvGvn5IJRVI8qS6SGsf
	U2LMM7NC1rS36tFjVRuMGDoC7XGP+Cae4Kl24K9ge58hNHCT
X-Received: by 2002:a17:902:da86:b0:22e:50f2:1451 with SMTP id d9443c01a7336-231d459a6f7mr183152725ad.37.1747676892205;
        Mon, 19 May 2025 10:48:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEkfT627Sx+Y3lijWGrgnOM4K80G49i9mNQuYpNlnrPDaKycAmPH3/wNvhLyeyCLDdXtTPxaA==
X-Received: by 2002:a17:902:da86:b0:22e:50f2:1451 with SMTP id d9443c01a7336-231d459a6f7mr183152505ad.37.1747676891821;
        Mon, 19 May 2025 10:48:11 -0700 (PDT)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4afe8b0sm62651425ad.89.2025.05.19.10.48.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 10:48:11 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>,
        Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>,
        Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>,
        Mahendran P <quic_mahep@quicinc.com>,
        Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org, P Praneesh <praneesh.p@oss.qualcomm.com>
In-Reply-To: <20250507-fw-stats-mem-leak-v1-1-8d4d1d8ec0e8@quicinc.com>
References: <20250507-fw-stats-mem-leak-v1-1-8d4d1d8ec0e8@quicinc.com>
Subject: Re: [PATCH ath-next] wifi: ath12k: fix memory leak in WMI firmware
 stats
Message-Id: <174767689082.2567051.3798725859514530074.b4-ty@oss.qualcomm.com>
Date: Mon, 19 May 2025 10:48:10 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.0
X-Proofpoint-GUID: GD0-uFEOXc7IBr2kD7wDfvkDTLOjZa8C
X-Proofpoint-ORIG-GUID: GD0-uFEOXc7IBr2kD7wDfvkDTLOjZa8C
X-Authority-Analysis: v=2.4 cv=DdAXqutW c=1 sm=1 tr=0 ts=682b6edd cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=D1emlATrmXGj1goK3P4A:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE5MDE2NSBTYWx0ZWRfXyFnrFw+DnhEt
 ip6pEzmZIey7xVx1eF5U1sEccEbnIvrgnXDBBDm/VQnL82ebWMmXcEjRxKm3GZBGai/6ise2tVZ
 51ZedMRnAtSXFFwmdrcJ9QMJEbgwgbu7ffMs3lcOwj4ObEzEVGY1+zPGUOP+2gyVQCadm3Eu2dV
 59e1CgXcjIsCExRUaZvKx9cuf6qJ95EAPfIcpnVoAYHQSEwuyN3dJjhQYeO9OeHThgMnsQR7rtt
 cWKzLOtoBUCD2crRLfbAlX7Jmn3YQqqvqkeROkbPTNkQSuCgkyljdO1jCCggh2igr+5T4WSizhw
 CH089rY8FBVia/ZSQDM+seYsJ6PRDESqprsiD5BVjoVJsJ3fYPji54sOLWBxVY2uFvcM/blh0i3
 PrcmXlOcViHtDRatduICclYPSownThFKajk2rkHruym4VM/zUJIngW2ce+qwPAjhiRz1GDdE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-19_07,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=959 clxscore=1015 phishscore=0 adultscore=0 mlxscore=0
 spamscore=0 malwarescore=0 suspectscore=0 priorityscore=1501 bulkscore=0
 impostorscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505190165
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250519_104813_478773_8500AF4E 
X-CRM114-Status: UNSURE (   8.44  )
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


On Wed, 07 May 2025 22:41:19 +0530, Raj Kumar Bhagat wrote:
> Memory allocated for firmware pdev, vdev and beacon statistics
> are not released during rmmod. Below kmemleak trace is seen for this
> memory leak:
> 
> unreferenced object 0xffff8e76aebdfa00 (size 256):
>   comm "softirq", pid 0, jiffies 4299272453
>   hex dump (first 32 bytes):
>     28 19 71 c3 76 8e ff ff 28 19 71 c3 76 8e ff ff  (.q.v...(.q.v...
>     9f ff ff ff f4 d4 03 00 aa 88 09 00 bd 40 23 00  .............@#.
>   backtrace (crc dfe1b440):
>     __kmalloc_cache_noprof+0x2b0/0x370
>     ath12k_wmi_tlv_fw_stats_data_parse.isra.0+0x44e/0x730 [ath12k]
>     ath12k_wmi_tlv_iter+0x5e/0x140 [ath12k]
>     ath12k_update_stats_event+0x85/0x300 [ath12k]
>     ath12k_wmi_op_rx+0x624/0xd70 [ath12k]
>     ath12k_htc_rx_completion_handler+0x1f4/0x330 [ath12k]
>     ath12k_ce_recv_process_cb+0x218/0x300 [ath12k]
>     ath12k_pci_ce_workqueue+0x1b/0x30 [ath12k]
>     process_one_work+0x219/0x680
>     bh_worker+0x198/0x1f0
>     tasklet_action+0x13/0x30
>     handle_softirqs+0xca/0x460
>     __irq_exit_rcu+0xbe/0x110
>     irq_exit_rcu+0x9/0x30
>     common_interrupt+0xa7/0xc0
>     asm_common_interrupt+0x26/0x40
> 
> [...]

Applied, thanks!

[1/1] wifi: ath12k: fix memory leak in WMI firmware stats
      commit: 246eb353fbe9136ab3dd2ef979764a13984989e2

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


