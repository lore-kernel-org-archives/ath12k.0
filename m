Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33760C02180
	for <ath12k@archiver.kernel.org>; Mon, 13 Jan 2025 19:24:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MFV3aWNNS+t43F5uwTgcNEgS2obH2Bxb2qDmFQO3CYE=; b=xVynKNvliO22jIDsc0D8AoHwqv
	uh6J2LSWWRWvr1iJKH60sN/kBLRwWIbnqRj8ik+rxENBZmOYt48srIYtFfAHuk61PMyo64M49To83
	7XNHxeIzo0XpsierbIIAkaUY95ffX0WMGJFboHOal/PmXunTsO1M8Z3faAyltxQrMigKHgwjWoqnw
	WQGnHckGN5o5Ri5cwnKMpzfNx8VFNhwqRlvF0TZLP0fBT9nhMp7QFR1Pw6TbKj++TCR/uGKue7pKm
	4PaXBw2iT88kJvz2jmT4ZxrSo9DiFfUxGVAN5LYf2NZ48YBCTKBJVgObnGGNwUHc6cmnqMiU9vAmC
	DdR1MfBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXQ2z-00000006Mr9-44ta
	for ath12k@archiver.kernel.org;
	Mon, 13 Jan 2025 19:24:25 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXQ1u-00000006Mcw-3Fcm
	for ath12k@lists.infradead.org;
	Mon, 13 Jan 2025 19:23:19 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50DH3eT3020057
	for <ath12k@lists.infradead.org>; Mon, 13 Jan 2025 19:23:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MFV3aWNNS+t43F5uwTgcNEgS2obH2Bxb2qDmFQO3CYE=; b=Y7Bz+49ii3WJMBW9
	qgjk1kc/D+3bkwkSYJl482XuzAHPOauUZv8rKjUuvcC199I0aUQkmJ+vnJceobDU
	rh6dCM/1//bXoME0cOSjhRtcqRIhRZ96OSmdrv/IqueT9FaqPEsNNLpvdSGvz88u
	l73x5MrQVqkJL34mbkv3oBIBYCs2sL3eYn1sIKBXKvFviKozzyajPatmnuTJGclP
	Xnx/RX3JYy/IZm8TsuYiGdLQE8Vh2nTRcLRyBzJJFVTnAElRwpomXEervL3aeEvi
	1Lw/LbuQ/ETV8pZxuS3l0P44hLrY8sBp/Z/v7ew/kTeX4yekE+daPIwIWNuzq13K
	Ux/xqA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4456wa8bek-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 13 Jan 2025 19:23:17 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-21648ddd461so90670815ad.0
        for <ath12k@lists.infradead.org>; Mon, 13 Jan 2025 11:23:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736796196; x=1737400996;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MFV3aWNNS+t43F5uwTgcNEgS2obH2Bxb2qDmFQO3CYE=;
        b=k1pE7XFOLYs2fubu0o+ma1V40BQxDle11artQWLV3ILiRvAUOTibgbghT61vuAAGGa
         KbomTCqJ77jV7SGD/7IceoJgZ1XZoOGbWbHfTi1FwK6wIM6fu1QU0eFm6KSpOXBOFPAy
         mW5pcTQxDiFBolZqMSMCe6OjN8UygRLAuaCaWsBZL73nBg5xrXtwHmTwHI/A6qu7ew2y
         EpYB9AoXk/XjH9I66s0IP6fGYwY1tWMtLYKjI4IkUk+KzjUA5EfFME2xM9jsVH2vQSRC
         98cwjJDmmI6mOdjxZe+0XVPzGtPlAfUEDYpUbQWdYMUJyvtDHQXXP3Pm7Ks3DLIYmltw
         QmOQ==
X-Forwarded-Encrypted: i=1; AJvYcCWfJivQP+7ush32lL6OaLYMYrzRKjDGrs2RlA/4YM4PK5/77QwnEUuFh9r+3ueIFkV9qBxveXI=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy5OahaaRqSxtbMpANHFHB2sGUMMxmrsFXrDhYyGmVE/CGZS4hh
	6GTimZTWMsRT3umH8uh8/3AHSTmE/BwUR+seZxHRUIn91Nlk1pG2POnrTaa6bGbLH6gn6yeAb6u
	8E7+Hd6EuXn5STtTAH5DXwS+YOEWAE7ANDl6F//IrNeZSt9sjfKWXgx4L63kN
X-Gm-Gg: ASbGncthxK85B9LsILi+QPcRfYY+mUYjjQc5EwaXgRQUuAHHqRsO8LX7rfisxxIw/y5
	CC4Srf/cERj+0c5glh0GfJWCR30ABIGRXlxCnQp2ccgPgDTdiOwni/zydVyet8lyxQdfIW4tnTy
	hQRshSt6Tf0f2+MN642WI9WaXqxv0BfWIdpGfhvoth5NPCuBAB8NBUB+ZRMbdaMtUdYyp9Em/92
	OZ308cqw/1nNNdGA+rIcpIwsjzcZyeWu4Rot9ipS6QMYlxZqUZzv054o9igfUD7Sxuu2I2x/X56
	cfu7zfgJkgrMYYg9Z2H3MNvHR9iT30y4iQhtp6blOYkesMnaPA==
X-Received: by 2002:a17:902:f54d:b0:216:5af7:5a8e with SMTP id d9443c01a7336-21a83f65878mr319923045ad.26.1736796196385;
        Mon, 13 Jan 2025 11:23:16 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH+hkVFHMduF9zujMICY19YD28FULovU7wGDvUztcC3lTrH9ftOX4fFFpXyDrtI6NVzk4ROMg==
X-Received: by 2002:a17:902:f54d:b0:216:5af7:5a8e with SMTP id d9443c01a7336-21a83f65878mr319922775ad.26.1736796196028;
        Mon, 13 Jan 2025 11:23:16 -0800 (PST)
Received: from [192.168.1.111] (c-73-202-227-126.hsd1.ca.comcast.net. [73.202.227.126])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21a9f23499csm56196645ad.193.2025.01.13.11.23.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jan 2025 11:23:15 -0800 (PST)
Message-ID: <1f4d5894-c04f-476e-83f6-71e3c5aff231@oss.qualcomm.com>
Date: Mon, 13 Jan 2025 11:23:14 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/10] wifi: ath12k: fix ATH12K_FLAG_REGISTERED flag
 handling
To: Aditya Kumar Singh <quic_adisi@quicinc.com>,
        Kalle Valo
 <kvalo@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        Karthikeyan Periyasamy <quic_periyasa@quicinc.com>,
        Harshitha Prem <quic_hprem@quicinc.com>
Cc: Kalle Valo <quic_kvalo@quicinc.com>, linux-wireless@vger.kernel.org,
        ath12k@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250109-fix_reboot_issues_with_hw_grouping-v1-0-fb39ec03451e@quicinc.com>
 <20250109-fix_reboot_issues_with_hw_grouping-v1-7-fb39ec03451e@quicinc.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20250109-fix_reboot_issues_with_hw_grouping-v1-7-fb39ec03451e@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: XHqpSI18-NEjM-rM-gmWkHScYqdZfAnn
X-Proofpoint-ORIG-GUID: XHqpSI18-NEjM-rM-gmWkHScYqdZfAnn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 clxscore=1015
 suspectscore=0 adultscore=0 mlxlogscore=999 priorityscore=1501
 phishscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0 mlxscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501130155
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_112318_940874_E7D371D8 
X-CRM114-Status: GOOD (  11.62  )
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

On 1/8/2025 8:25 PM, Aditya Kumar Singh wrote:
> Commit a5686ae820fa ("wifi: ath12k: move ATH12K_FLAG_REGISTERED handling to
> ath12k_mac_register()") relocated the setting of the ATH12K_FLAG_REGISTERED
> flag to the ath12k_mac_register() function. However, this function only
> accesses the first device (ab) via ag->ab[0], resulting in the flag being
> set only for the first device in the group. Similarly,
> ath12k_mac_unregister() only unsets the flag for the first device. The flag
> should actually be set for all devices in the group to avoid issues during
> recovery.
> 
> Hence, move setting and clearing of this flag in the function
> ath12k_core_hw_group_start() and ath12k_core_hw_group_stop() respectively.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
> 
> Fixes: a5686ae820fa ("wifi: ath12k: move ATH12K_FLAG_REGISTERED handling to ath12k_mac_register()")
> Signed-off-by: Aditya Kumar Singh <quic_adisi@quicinc.com>

Acked-by: Jeff Johnson <jeff.johnson@oss.qualcomm.com>



