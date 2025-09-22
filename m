Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87949CAC592
	for <ath12k@archiver.kernel.org>; Mon, 22 Sep 2025 20:43:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3cqwvkVWW2/xt/kPparBDxu8gcaOUPtl4f/hYXlPlio=; b=FXgVsMF2rxS8ajABupJy7HatKG
	M987WbyBRr5Miu7xrdeDQpY1kq5vfRyW8Jjl5bEE7nQOJcT76ZHXIItLf7ZVkhU+ql22Aa/pCKV88
	at5IP/v+TmA1qf+PJt6cvDSF6ouvfbs+y2VymmR0cbq72iFDasc0rXrOAUjW8KJrZsg1sEU2hA5Y+
	8G1BWVpYA8NC4eol7fohDIlR0kMN6PSHiIXq/1hFyWFwoI9LqsU2GLKHihXEi3xL593cCatv8ko6M
	KydJrag1DkXOJE+6USGowSfxmpP8mdJsYWEv42bc1PupyXRB+0OYFbFQHzRHSOGJJrekPzjq3f5iW
	l6U5mfmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0nNO-0000000BTPv-19iG;
	Mon, 22 Sep 2025 20:43:10 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0nNL-0000000BTOx-2IwC
	for ath12k@lists.infradead.org;
	Mon, 22 Sep 2025 20:43:08 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58MHa5tn022012
	for <ath12k@lists.infradead.org>; Mon, 22 Sep 2025 20:43:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3cqwvkVWW2/xt/kPparBDxu8gcaOUPtl4f/hYXlPlio=; b=nkoc5lxtdi7i3YzX
	TtWwQ+ToWmpiQPe8M4IaK/5+niNG8n0m6gVd+E32mshgPIyp3SrbUW1arYFixnK3
	qY6peCU+d94v/ZvqRiFF62L03bFoEOC1JI8ZdWW8YbhWMKvr+3eD1gBCmNOBH6Ux
	thKCuKGZwbOz0o8yhgJdHI9xbwc1E5vP80hO4ZfHhUFQ271XYSeRW/52Xsj8k/Wu
	RWbXhR5oX7tDTaXGVNdwWrjnrs7DTRkklq9cvbPjcdBPMo38ZfnNOlnpUNE4le7u
	5tFzUsGzHA3RTqBdj3wj/voeNuXtgxtZs5XwWectTWMCTZrKUjEjlyLT6smB0/jx
	ZwqS0g==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499n1fe2bx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 22 Sep 2025 20:43:05 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-25bdf8126ceso96273515ad.3
        for <ath12k@lists.infradead.org>; Mon, 22 Sep 2025 13:43:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758573785; x=1759178585;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3cqwvkVWW2/xt/kPparBDxu8gcaOUPtl4f/hYXlPlio=;
        b=VBmCPpWLO3e7QqO6iD04sZSg9oYUJOAR/ogthek6nD5fWcdJDVpoSZvIbF8d6CtNam
         /2WhbGiwx8pF+LpJd3KkPQCV5uku0SUmAqiK1oxdfWIfbYpC7uLP1wsLGBDXbOQfnwtl
         l65HqybFWTQIMaMrIC7TnKdu8eozRqmKoE43GEnvFbhcNBN0yOAUqKlxMeeopdsCWQXS
         y7dUdY1UVb16XCOdaD4XmZ3rv3JMzrTnaZH4fmT+JGfjbIPD2lf2oigR+eEkqJovtf78
         Jly15UCs2fPLc4q6S844WpcuEEXGpTx4rm7S9x8ikrfZ1Z6Gml77jU1PD1GyZpzb5CdF
         EaBw==
X-Gm-Message-State: AOJu0YxPT2Z5Niv/B4coSW/UQ9wdIEpESuujqJ+7bKsSwoGKn5dIjx/c
	ZMIelczp42jaerUIXpjOQHGitBx9HRW6FeIf3bt4EWHNeLdi7npbztLWhG6GdjXb1VcuhyZCcuJ
	cZV5RkG0VL28S8MCvqz8tA1SiNipc+J59P8CCy3y5zBNrtKCQtCc1pm8JSDE0yYsC1XemzONZ
X-Gm-Gg: ASbGncsJOEJ5AnTVkcVQr/rmVggcRz2M+RUuOSXbMRAb2FjDGefNVywFcC/rSE5Qzp2
	hKqRMUKbUw5e91BfpyN5R8CBVGh38O87YsdFWayXJQnPEJBzt7DITLfNdDJNfGX4+mnQ5RUKMIa
	rou4o9vIIGe2c6w9ytT7+r0uBO20GI2SlkWkmajXssbh5ntw0daLYC589BYYiqjlRAjOBKS9DoL
	0rnPmScdL41IS64ldG9ih4oO6vRZXk7O/Gl8u+WVarfM6pdUBUghyVUc9hDx6nFgBeXkat2gsYY
	4cj6Hz7x92ZcJbZFFYFTnjVaZSojrF0GSMDN+H0YaLrt+AYq8VzGN6cVPBG8kA/+3BkXWz4yF4J
	U
X-Received: by 2002:a17:902:f101:b0:270:ced4:9116 with SMTP id d9443c01a7336-27cc6785ebdmr1107195ad.33.1758573784564;
        Mon, 22 Sep 2025 13:43:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IERMjo0/jq7MVqzGKb8aFEWS6Ln1AUh3yqaOjrG0v45gklsxV8QHYKyxlA/kLyAlFJ2Y8jDuQ==
X-Received: by 2002:a17:902:f101:b0:270:ced4:9116 with SMTP id d9443c01a7336-27cc6785ebdmr1107075ad.33.1758573784141;
        Mon, 22 Sep 2025 13:43:04 -0700 (PDT)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-27cc8b251f7sm817935ad.8.2025.09.22.13.43.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Sep 2025 13:43:03 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: ath12k@lists.infradead.org,
        Nithyanantham Paramasivam <nithyanantham.paramasivam@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org
In-Reply-To: <20250806111750.3214584-1-nithyanantham.paramasivam@oss.qualcomm.com>
References: <20250806111750.3214584-1-nithyanantham.paramasivam@oss.qualcomm.com>
Subject: Re: [PATCH ath-current 0/7] wifi: ath12k: Fix Issues in REO RX
 Queue Updates
Message-Id: <175857378340.47334.15939102906187566074.b4-ty@oss.qualcomm.com>
Date: Mon, 22 Sep 2025 13:43:03 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: KuwuweLUAuwtrHsmOZE1jQbbZNK-aV30
X-Proofpoint-GUID: KuwuweLUAuwtrHsmOZE1jQbbZNK-aV30
X-Authority-Analysis: v=2.4 cv=No/Rc9dJ c=1 sm=1 tr=0 ts=68d1b4d9 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=8XKf7K1G5lwa0OuaegoA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAzNyBTYWx0ZWRfX+d4Uo2Y0n4cr
 n389Y+Fnz5M6bs079HOtZjMeSxPUB0MQEtB05QK0qiUReQB2/QqvrglLj3Vp6VTmKP1PDBuQ+AJ
 P6Jkb98WPVbrKG25iWULXjJtw+m7K9zzfQvPMQE2fBi8rT+OrFp6DLZgGsSwha1jfeHaxLCnu1w
 lxPrBWElhmzH7435gjwAtKvLvOAhOFtYXHvvdbGxWzFggFoFG/C7m37s6FlugZRZN9+SE2oMI06
 QG7o/aOjIVS3WTXIR/U0FQQK//iVv5tZuo9MB/EliQjPRUiWKJK/4YHo3R8MF7zjqQVZObEfa4n
 eL3n/a6ucdarUALAw6gzQlWgYts6yutL2kbXUe+ERGU5mY/m9zyLlC1zwlI08Nst0GuRIskpU39
 8b7ZJxEC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-22_04,2025-09-22_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 suspectscore=0 adultscore=0 malwarescore=0
 phishscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200037
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250922_134307_607604_B777B415 
X-CRM114-Status: GOOD (  13.13  )
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


On Wed, 06 Aug 2025 16:47:43 +0530, Nithyanantham Paramasivam wrote:
> During stress test scenarios, when the REO command ring becomes full,
> the RX queue update command issued during peer deletion fails due to
> insufficient space. In response, the host performs a dma_unmap and
> frees the associated memory. However, the hardware still retains a
> reference to the same memory address. If the kernel later reallocates
> this address, unaware that the hardware is still using it, it can
> lead to memory corruption-since the host might access or modify
> memory that is still actively referenced by the hardware.
> 
> [...]

Applied, thanks!

[1/7] wifi: ath12k: Increase DP_REO_CMD_RING_SIZE to 256
      commit: 82993345aef6987a916337ebd2fca3ff4a6250a7
[2/7] wifi: ath12k: Refactor RX TID deletion handling into helper function
      commit: 7c32476253f11210ac24c7818ca07e19bc032521
[3/7] wifi: ath12k: Refactor RX TID buffer cleanup into helper function
      commit: f829a1f8f27555742c9759870895f22c4ab7febb
[4/7] wifi: ath12k: Refactor REO command to use ath12k_dp_rx_tid_rxq
      commit: 6a01985105843e8c043c2bffe25c54b71bc45002
[5/7] wifi: ath12k: Add Retry Mechanism for REO RX Queue Update Failures
      commit: 3bf2e57e7d6cd3e0896c2aa5e86f11aeb7bc3702
[6/7] wifi: ath12k: Fix flush cache failure during RX queue update
      commit: 5e32edc6942570429d9c64d0641fc2addbf92be1
[7/7] wifi: ath12k: Use 1KB Cache Flush Command for QoS TID Descriptors
      commit: b706fb4e580ba66b2c05be93809807c9312008e2

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


