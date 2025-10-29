Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 413E1CCF9EB
	for <ath12k@archiver.kernel.org>; Wed, 29 Oct 2025 14:26:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8lRCEMmy9OZlhkQ8RmEl5rJEU/q4AS+Z5wN60SHfen4=; b=mXbVCirmHp4xWMIxdG8ZHsJB5I
	Ub4bn78Cs0MsNq9cLNRSZFFPfGEB60uV0WibRBvdDW5oPMdO+U0ZUeBeq4DmmC9/wOssHPMdJLNQL
	F0DKxKhvO14AY9au4EIDfNKEKoCvyDQM6X0+8TkdeLMsNjyWndtviq1kleJ+qIQr34rIA9i737Bhg
	BeUvYTR06HaswbwzXKrwwBg/gCx03tJjqe8ZVMrFv/VO+hAOYEsfaGC7SLw+XD9j7E7o7pZo3XX1g
	44X0zuIDo2HIUBCfOyPlbc1DDLOFdVTlI6TiAJCbPiSMzBPn/7RvzNeLnrGC5Znc1PetOwa5t/RGw
	ucms335w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE77p-00000001ZRZ-42tK;
	Wed, 29 Oct 2025 14:26:09 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE77l-00000001ZPn-0YmF
	for ath12k@lists.infradead.org;
	Wed, 29 Oct 2025 14:26:08 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59TBdvn4434635
	for <ath12k@lists.infradead.org>; Wed, 29 Oct 2025 14:26:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8lRCEMmy9OZlhkQ8RmEl5rJEU/q4AS+Z5wN60SHfen4=; b=EG7uUYc+8OTWFxlc
	AbPYX791VJcYlKkwwm6u57Y8YcEtntoUAkKf5o8AWtM8pWtaN9Gz6ZhvfwXR5w+a
	uNcIPAOnpJ+Oq2LbYIA5nx4We0DvIUn7o2nwb94GoCqRRIg3/8+KsX/7Hmi74En3
	r2ceN9B76Udfu2u9UIfBfgyfGSOAZqyXRRVKVw+u68F4gYI5Sdgf7RmlyypmJDiN
	8PFVjeW28runf14z5AbVeTNlHZ17rprZBEZ9g1R3dMguM3U7+pfAUvpQU9i8Srq7
	GIesfSJ3dom1nhU9YoW5od6nXgnkH5yUWSrdF/aurrd3z2ERh+skYcFJQPjdG2dO
	Bs5P0Q==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a3j8jrfa8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 29 Oct 2025 14:26:02 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b630753cc38so14523744a12.1
        for <ath12k@lists.infradead.org>; Wed, 29 Oct 2025 07:26:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761747962; x=1762352762; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8lRCEMmy9OZlhkQ8RmEl5rJEU/q4AS+Z5wN60SHfen4=;
        b=Q1cBrPfwWlTd7pi0S/jqttyRjfuf2RD93Xovmgr3Iy9rvHExKM33F9/pagp2BSb57/
         2FSlBd329VTkCrWxYIgktoZo/1kEzQhrrjEAp5IX7pLDKNMHrCGwRRfFKM3MxUd5Vo8n
         Wa2kVpdACpN/nddyFjHjikUYCHDDOd1TPOzcebGXOWRzXHZoY8vnuQmXGJYxwVzbc76T
         abzgvLXXpkFDvbr3y2GM09pB//HlQUCR9go9scjSg26Pqd/hp6JPfD2DyGN9/6+MAMO9
         W/4S4A6iGuYjSPmN+be8fsaPurYCdTN8Xrh9zU86Gw6NwpF9j9arLPc5jbLvi8OeF+Q6
         fLGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761747962; x=1762352762;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8lRCEMmy9OZlhkQ8RmEl5rJEU/q4AS+Z5wN60SHfen4=;
        b=dSxtBqwo60z5C3iGomI2ruUouCmobLO/aVUT7Kg3qSjN+S7ZVR1zODWs0Tl72KiIbY
         RsTBSsHsQJWlbCWtlkBNcKybyD6gkOsKGe3JJTi9c9hHrkLA/JkWtXpm7pss8tDrTg0s
         tW9QlPmWEuEfk8gzuqPA8HpWJIy5vuGy+UaTXuJYE1CM/zDI+rP3W8ffEueWO/Xu4EF9
         39PwgiwstvZx31x/qxGzu8CCUyXQxrbCLWkff0uNQZKwMBt0tl6wK8RAo/UKakzmyWk/
         1ucpGc9Ds77VZsxje41bM0ebdLky9INDGrSlyxn9YzA5zfBuukcbBjJzwmzleWvd2B9F
         rXMQ==
X-Gm-Message-State: AOJu0YyvFRKyfrpGQGsHEo3XVs/PV0O10wkszdZFC3MYVZcV+K5ZB/MW
	l3LKhktaaMYWBjEV8SRC9eREwhc3y0D/uGi7BZSsDbX5Wm8xJHDEspIc1QHVnCuKlvpywJxrurt
	qmGdlsj/bJii6cW5S2nwJ+SH8DjP+CtL4vd/VqM3J05LpCEmVY27sgoAXgP6zjUDz
X-Gm-Gg: ASbGncthiCQI18o269jYQS/ZKnxRF+a06SGsaMpvxK0Em+3v6t5xKIXFabGWRjiV44e
	fRc3mGRTg7jnrQnH7jCcp0NwGWRnKw+7fC3081BKUVMOhZWgxCQYAhPLCQzy2GFqvTmeoKZJZK6
	qnhEWuJ1OcT70VKXsJjCqDku4urYJt/0OGCklsuMRV+lL54PuJ1ptbzER9vPwBX+qCvaEGQIUuk
	WfjJDRL8ucrLoKEM4iZe0E+dxwBstAt5pCBgYxR4foC18TMVvOQlyUKZxt+iohPyKXVXxfB9WI1
	NazhWh2OnV7SmQkdoWCmpkGLEQ9f7tmqp4SSkW9nN2qIlukEKURhwA1qICPgdAWmDgtiNpTbb3l
	RPTdn9JNIw9W1v8/OpjETpKZj25s5WgPClp1SRG6A9aui3ueuNNKojI43hao=
X-Received: by 2002:a17:902:d491:b0:269:4741:6d33 with SMTP id d9443c01a7336-294dee4b276mr35510285ad.23.1761747961339;
        Wed, 29 Oct 2025 07:26:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEVs9ARm8Q5wCdoLG9mCSaU6IsMR0Zt2w484KzdbhKLh1iw8y3iST3S4vvTj/Qii13tEl5pOg==
X-Received: by 2002:a17:902:d491:b0:269:4741:6d33 with SMTP id d9443c01a7336-294dee4b276mr35509925ad.23.1761747960807;
        Wed, 29 Oct 2025 07:26:00 -0700 (PDT)
Received: from [10.227.110.203] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29498d0996esm152263505ad.28.2025.10.29.07.25.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Oct 2025 07:26:00 -0700 (PDT)
Message-ID: <c7b1a108-6831-4e48-becf-45bac0e73d54@oss.qualcomm.com>
Date: Wed, 29 Oct 2025 07:25:59 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-current] Revert "wifi: ath12k: Fix missing station
 power save configuration"
To: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>, jjohnson@kernel.org
Cc: ath12k@lists.infradead.org, linux-wireless@vger.kernel.org,
        linux-kernel@vger.kernel.org, Ross Brown <true.robot.ross@gmail.com>
References: <20251028060744.897198-1-miaoqing.pan@oss.qualcomm.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20251028060744.897198-1-miaoqing.pan@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI5MDExMCBTYWx0ZWRfXxd19FjNO2uFk
 twWbgqgZtQactrHMCZXS6OrwRVv9cDmiEaJb/67mci7LC/gk6iptFhyF+LA4y8vWzbtfBa8e+dX
 FmcIJS0KCkMMDQjYRN4LDxeZJYgm20Ao7h8iV5f1SBKVB5uGoFVfI7cLl8pcuzivaTceudZP1Eo
 6/W9XaZqsdzBDLCMAK14fXlzrjsOqtfUpNZ0+H/DY3QeneVqCcDTSMmg4UBXCPvEMftrC5FJfuo
 xCLAL/E/AsKFNCIOjYpWcFeUNaQVVzvc9nrLS294MUGn/s0ZdLmWQgq0t6XZuM6m3ck/6B8takH
 wJ6c0uSA62MYWNgMdIV5TtT16z3liRadOdorY5ov94SN6Ga2ZwVW4uyCQUb3Sqnr2+sgOq8Etmy
 pmvmr/KzTX+ZfaVE2c26ul1+TnZvvw==
X-Authority-Analysis: v=2.4 cv=FOoWBuos c=1 sm=1 tr=0 ts=690223fa cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8
 a=WZLPHaEoEJzMMJhDTEQA:9 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: Y3XXr6oiXVzBW9o1_OSnlsNC8nO94v3x
X-Proofpoint-GUID: Y3XXr6oiXVzBW9o1_OSnlsNC8nO94v3x
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-29_06,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 adultscore=0 phishscore=0 lowpriorityscore=0
 bulkscore=0 impostorscore=0 malwarescore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510290110
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_072605_301714_E30654E9 
X-CRM114-Status: UNSURE (   9.03  )
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

On 10/27/2025 11:07 PM, Miaoqing Pan wrote:
> This reverts commit 4b66d18918f8e4d85e51974a9e3ce9abad5c7c3d.
> 
> In [1], Ross Brown reports poor performance of WCN7850 after enabling
> power save. Temporarily revert the fix; it will be re-enabled once
> the issue is resolved.
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.IOE_HMT.1.1-00011-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1
> 
> Fixes: 4b66d18918f8 ("wifi: ath12k: Fix missing station power save configuration")
> Reported-by: Ross Brown <true.robot.ross@gmail.com>
> Closes: https://lore.kernel.org/all/CAMn66qZENLhDOcVJuwUZ3ir89PVtVnQRq9DkV5xjJn1p6BKB9w@mail.gmail.com/ # [1]
> Signed-off-by: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>

Note to maintainers:

This patch to ath/ath-current has a trivial conflict with code coming
in ath/ath-next.  The resolution is to take both hunks, ordering them
in reverse xmas tree style.


