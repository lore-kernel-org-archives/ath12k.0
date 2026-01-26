Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B3A3D1950B
	for <ath12k@archiver.kernel.org>; Mon, 26 Jan 2026 17:18:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zH3vjp5NbkkI0jGBThNPSOpteuACRfXFCKcxG6Vgk18=; b=PBDltO1vFS0JXXXbuRtzB4VmFr
	HeG+Zz/5hg1UxGtn3OWk4IIQzK0PSw8j74XUsKqGnMklFhdRcIl/+MsjKOLKB/YlaDKo9I3ZbWc6A
	h6RNR/Tkell37Qaay4W7mdr5o/W7EdwWGhd/or+A0BjiZtWIGJqPR0EJIMg6xW2tfjNmQnwhEWGpl
	CJAvf54MOiNYJFUmMyWk8yChQC/0zrH7uCvXeWb4qlXrcY6mZcE03R9rblxVAZAi1S15krv9Gt3c/
	8C8mCOxTFJaPxwTsm+u0UcboFXJ+nJuOh6KTIPbO4FNfn+puoy0A4XMbeq9N1tbMXJqKKq1yhgCNH
	YlzMJUOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkQEA-0000000CwoF-1GyG;
	Mon, 26 Jan 2026 17:18:14 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkQE6-0000000CwnZ-0KEO
	for ath12k@lists.infradead.org;
	Mon, 26 Jan 2026 17:18:11 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60QFSTGK1018997
	for <ath12k@lists.infradead.org>; Mon, 26 Jan 2026 17:18:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zH3vjp5NbkkI0jGBThNPSOpteuACRfXFCKcxG6Vgk18=; b=Am5j4mWOTbFsmq4/
	5cpvbxgyeAoV33BRcGmx5Edppkbv0DAuTPTMrBem5J8lOimhYx5izzGu0zk2jLOI
	gqTkRSl/T32UrxgXNDGVRguL27YSBw51zq+aUglQZ6kU+WbRPMXaoWfMgzK0XduV
	Vr64t/v/CtnMQ+OsNoL+/BN6ReI1XSbOomD++MkFYBC854+nrlbhoM6EdVe8Z0XT
	3QthDVdrmqcdLLMOyd/Z/7X8IlsH7tQSv/hPwOjt7pnAqxqFRes3xFZMwuLuEzU8
	ZEBD2gPJxI+nEr4Q2ul1Hy05jT+iVv+P0jNnB0aRRkC46wDr82yUaxSFJdQmH9zc
	bEJHTA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bx2681tje-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 26 Jan 2026 17:18:09 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2b71bdcd037so2916408eec.1
        for <ath12k@lists.infradead.org>; Mon, 26 Jan 2026 09:18:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769447888; x=1770052688; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zH3vjp5NbkkI0jGBThNPSOpteuACRfXFCKcxG6Vgk18=;
        b=TSVB7JimDpVKtebSyOYuNrtQtNudiWnHERCF0UyQCC4tB36YidTlaq99YwQ9oChfMc
         KGNo8au69zov0pwiztzAzdCsOJBlODh2ymipOoTDGZihIRElpPRwZk3xTGPG+98/wtlC
         JLsOFdd/E1B6OzQxM/K41N3/eZTLQWzfGhguQRZTF/TCTv6XCK5PExEdDSHP8u9z70Fp
         eGeYcMLnUp38JLjP6HutlMl/OQPhIs1jgUbmyUmtZJBbASQ4Ydlh3G5TqhL5GLJ//G6H
         /JnvS/NxIYbjN4I/cdzz7xpo4tBcuDvClXcCwbya22pPV+d/D84ahbQJFsu7+YEYu1rz
         17Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769447888; x=1770052688;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zH3vjp5NbkkI0jGBThNPSOpteuACRfXFCKcxG6Vgk18=;
        b=eNzabnNl/WT/ARqPqlGc4TdySgIn/yy5LSPMC3IfRjhjjRfofzFkiGO1znIp6z9mlM
         QWqKV9QQhTZwJuDjwjo6Of8EaXJfPGTFLIP1UhdpsK5AeGVt8mRPfFF509obEFqlzREC
         dvK+sCigEJxL4NUQYn/Z3lYjukAvcSMcI2gsTYCuGXDBjdvVolxgdmSDGKFXhuALw9/x
         H1lWOEctUajjUm8veDL3Q1d66AZ03ptIzbeOlAuMTq82zNLGz1cuPPQbrGROqzfGVjOw
         uDKL4Du+MC6UOgceqmrSd2/kDp15bRZ623lpSqDsl+P8tvcPsxn3Dy9fsjyu2kpxGdDs
         GD3A==
X-Forwarded-Encrypted: i=1; AJvYcCXJIpXRxJmOjSZaMPshyPsWT0JcXiUV94/Pg0wLT+DWOZNZbjBz9Ql0Rx9GNjlEtZFs7i4gtSw=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy3b60yp3gX9q8XbjklqzhRyaciO3+S0oI4fb32jkAjP5R0f1Hm
	nwPFihwI8JaDj84Xuh831CPeiNQAl23SpiMWxhln1rLgqCYM3zAls/jgVYVJli28qJ4iaYw6+nk
	zfGNg2xYtWinsCBbk7yp/PD7drY9nmaQlXagMHFbQbmosLcx52i+5GH1q34J3WPuCQTML8bd0
X-Gm-Gg: AZuq6aLAojbskhf0r0gOXa2Xjq4C4x4TI7Mz4Jahz3fjt07yLXlxHgWXQbbBCkYJ/f/
	dHaRF4ohZrWR4KlNYmuFHgCZkWumHH6hUhb2sOwR28cSSdsz9AT4IChCWBWiT3HDxsZdfDO2dYW
	b7tyMn3hXJYrNKSFkA0/DbfztM1OJgdO6CFxRyjuXl/8hABw7u+kpnXfzi4i+1HW7kFcLUi/t3D
	XCaMbxyw3SLYCVBk4pSHgTVe0s5IUfxr3uqJuBs97rmkvT3/uUlSCR3SwI14RP1edF/9EXEEVHK
	RNzdKgOv1k5agaYSwrjt28YcbJ0deIgOCBi+xyFkLBk0+YdJ824LUSxsUjA49hj8TvG2mmWLIZs
	0zA/EVABc4OLdlxBx8mzRz5b1MMlxVKVeqc4yy7kw2XiaTbSCZXisWwV5TC7z9RUwQGWN2Ehoyi
	WY
X-Received: by 2002:a05:7300:cd44:b0:2a4:701a:b9ba with SMTP id 5a478bee46e88-2b7639848c5mr1941387eec.14.1769447888075;
        Mon, 26 Jan 2026 09:18:08 -0800 (PST)
X-Received: by 2002:a05:7300:cd44:b0:2a4:701a:b9ba with SMTP id 5a478bee46e88-2b7639848c5mr1941370eec.14.1769447887376;
        Mon, 26 Jan 2026 09:18:07 -0800 (PST)
Received: from [192.168.1.3] (c-24-130-122-79.hsd1.ca.comcast.net. [24.130.122.79])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b73a6e9933sm15799011eec.13.2026.01.26.09.18.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Jan 2026 09:18:07 -0800 (PST)
Message-ID: <39c1fdf4-702f-4311-806f-6a14e2fc0de9@oss.qualcomm.com>
Date: Mon, 26 Jan 2026 09:18:05 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: QCN9274 doesn't work on Linux kernel 6.19-rc7
To: Doug Brewer <brewer.doug@gmail.com>, ath12k@lists.infradead.org
References: <CAG0V13S2qZ_PmAz0bnnvq95bEX=paB1xAYQNnObVtXiGhnHupA@mail.gmail.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <CAG0V13S2qZ_PmAz0bnnvq95bEX=paB1xAYQNnObVtXiGhnHupA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=bIEb4f+Z c=1 sm=1 tr=0 ts=6977a1d1 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=Tg7Z00WN3eLgNEO9NLUKUQ==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8
 a=C4_YaRPWuNsn_dpXMIIA:9 a=QEXdDO2ut3YA:10 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI2MDE0OCBTYWx0ZWRfX8e0uJI7GGAVE
 vXNTfeOkcKwwAHcnC4X8fLI3Xvyp7HWrVB47cS633z9Nxf1nsQ6+pbQjFj4V9u4n1SWISEufAPA
 +VkZgZrsP5XYugbWw9OjT57aP4isZr0n3usQRSZmR6OhFlxU3BfcTpre0kKB2YGXldJ14S4lu7T
 J3zRS1ZxYWfQLykGanMidAUYj7xxXXzbH9uRAZzgQXdEvnHDsOohVgRYixiPAq9IVeCvGAAJOU5
 42VT7Vq+GQhGTuDHvRrr8Vbx8aYSYUvgQPMr2zhFaiN59U/9lbPZrP8kad8N8QelV4B2PP6jzDS
 wTncpB+bujLH03xXHyjcbAAphtBN+r8TihMtOGi/o9pfnOoLDWXyQ/q2tJQ3++cfUg+SJiNRZ8M
 yzLD20FEVA7rxpdCbGXa1FDn2rAfx+a05LTpXcr0+QdDKGcOK5fFuq9g1Ude3/xMOhd9vLquW4w
 boTDt8zr78dg/Zu0faA==
X-Proofpoint-ORIG-GUID: yoat3mcjOkchn9xzk7fptBRxeMSJN3-s
X-Proofpoint-GUID: yoat3mcjOkchn9xzk7fptBRxeMSJN3-s
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-26_04,2026-01-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 clxscore=1015 spamscore=0 impostorscore=0 suspectscore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601260148
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260126_091810_123969_435D0C08 
X-CRM114-Status: GOOD (  12.85  )
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

On 1/25/2026 7:10 PM, Doug Brewer wrote:
> Hi,
> 
> I tested the QCN9274 on an x86_64 system with Linux kernel 6.19-rc7.
> It appears that the QCN9274 is not working.
> Do you have any ideas what might be causing this? Thanks.
> 
> # dmesg |grep ath12k
> ath12k_pci 0000:03:00.0: BAR 0 [mem 0xdf000000-0xdf1fffff 64bit]: assigned
> ath12k_pci 0000:03:00.0: enabling device (0000 -> 0002)
> ath12k_pci 0000:03:00.0: MSI vectors: 16
> ath12k_pci 0000:03:00.0: Hardware name: qcn9274 hw2.0
> ath12k_pci 0000:03:00.0: qmi dma allocation failed (29360128 B type
> 1), will try later with small size
> ath12k_pci 0000:03:00.0: memory type 10 not supported
> ath12k_pci 0000:03:00.0: chip_id 0x0 chip_family 0xb board_id 0x121a
> soc_id 0x401a2200
> ath12k_pci 0000:03:00.0: fw_version 0x150c0673 fw_build_timestamp
> 2025-04-24 15:29 fw_build_id
> QC_IMAGE_VERSION_STRING=WLAN.WBE.1.5-01651-QCAHKSWPL_SILICONZ-1
> ath12k_pci 0000:03:00.0: failed to fetch board data for
> bus=pci,qmi-chip-id=0,qmi-board-id=4634 from
> ath12k/QCN9274/hw2.0/board-2.bin

There is no board file for qmi-board-id=4634 in
linux-firmware/ath12k/QCN9274/hw2.0/board-2.bin

See also the thread:
https://lore.kernel.org/all/CAKyS+Cbdy25Y2ii+=DLA1EWkvCySYEOmSkBrrcHhy5mXGJ5ksQ@mail.gmail.com/

The device manufacturer needs to supply a board file to enable this board.

/jeff

