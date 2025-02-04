Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29B70C0218F
	for <ath12k@archiver.kernel.org>; Tue,  4 Feb 2025 07:35:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XNk5GEHY2vpwvgWChX+aKrs57eHJi/VNa5EgCgXUgm4=; b=nWx8F1llMChgsVRAlo1jLgzcDf
	QZNb1pLOEylup683f0SVa6Fcd67gbJTa7aBcwn7PbDJ6kmFNudSQJjWYhqiHql/s681JwpAgYEzIz
	VXzj+F7T/7HiR0xiqERp91rCSPEcCJ1qeLXU40B35e5YOFxlAA7Dfoi3IFAX61vzvvA06ywLOj4Lz
	VN39QiCNeWKizSzsOcWBeC1uvOKezClpUaZRR8Ti/01mWyr4REpU1yB76hg9sU07fGeX8oBMCzxHG
	5voMzlztXJ1IPonoaA7kRan56ad4wFPvdvsUMJCJhxBOx8Pxqhrq66bRYGK3aZVllSv79rSXjkPOj
	LdZzwXkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfDTL-0000000HQn1-3qGr
	for ath12k@archiver.kernel.org;
	Tue, 04 Feb 2025 07:35:51 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfDTJ-0000000HQli-3vwu
	for ath12k@lists.infradead.org;
	Tue, 04 Feb 2025 07:35:51 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5147GYDt011196
	for <ath12k@lists.infradead.org>; Tue, 4 Feb 2025 07:35:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XNk5GEHY2vpwvgWChX+aKrs57eHJi/VNa5EgCgXUgm4=; b=eCmmLo7QvWXxzOEh
	DKrfBzNImWeMRuuj7hsXn+x+2azYN5YZqx/xEVriqeDPl8j6HaPQ60nc8cPVprwL
	jgeR2oMvdWc5j4RSktiz4oFcgpNLbM3gqbvjOBUmEUk7fbxaSbPPPSonATUUXBII
	JjcY70DQXFSDOxODhRTflO15ljUYCuE6rSeRZv0uySLXzB0O0Z6wkDpIQbrri2h4
	wiQuBwvorCPAjfbkycDLqv1Ihn95Jz0HML4qy/1fooxGjrJVfTG3ueYwEUuWZ2oC
	zRepaEdoseSNTdGQzKZewxwA3nZRWk8tOAdbaSs1Ap5dZTzK3pD8M86SZOn2wW3+
	ynZfZQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44kec4015f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 04 Feb 2025 07:35:49 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-2efa0eb9dacso10324301a91.1
        for <ath12k@lists.infradead.org>; Mon, 03 Feb 2025 23:35:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738654548; x=1739259348;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XNk5GEHY2vpwvgWChX+aKrs57eHJi/VNa5EgCgXUgm4=;
        b=WmUiusj9BDNcUnDTHa3tjorrO58id+9gLh4XvUUpHnqLYvWq3GqMh1Fl7Y8zwlQBJo
         S8nv0ZjOTMZcZpo9/8fVCdZUUgWycbDd2qvaRvUQ+qrNCxvDpyCHwLFmjv0Jq0JHY1Hq
         muiXpmCbzJyDUspuGGzl95qLlzcrrZZX/IbpAf5nlcqzLSaGwt1vZhMo9bFcNe+NAsiw
         V3ShE2fX40U5n/4XAw880dYg/i7mi4rIuSbNw5K9khs07AiMHjvzFB1T4hG5j4V7Da9L
         Hk9lGD57iYaIjq9Iwar83zmYYa50kjJUs02xmF5cTZLh3QtCAwZtxA1N1dcd1WdtIQlI
         MjaQ==
X-Forwarded-Encrypted: i=1; AJvYcCU/dVndbq+4pWflEk86y0zy2Y8ETsc3i5pQ54hhwBQjVEfgkGjyPKBIn5nzX+vYYwx2aDFwdyA=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy5EIzvblHbUnjQw5djQ60PVoW/MOdyu1mAhCqHZ+EFKSZyg8rZ
	lK3TC+vc94Rr11ZNSARCW4YML8335w4CSVj2ihsq+vKE3/EzeGMbHPNOn4O2xUzqfxepdyrfWW4
	ELPRz/EJJgwc4AVQ/y72fY88Kd0iglriThrg3v79TFH4xQDrzZ4pmNTyf6OhT
X-Gm-Gg: ASbGncvhGDGOwRw8WDpITC5w6iCpPcBxq63ntaTUPO2u/cjfo6OGtJ6vIdTBBTAg/oW
	5r+ZEWFmSeWNuJ3+F0zVutq5mfRmFXUxHQqM07Hf0GSShip+vCNiWTbFXDrFXMJA2hzpRdwkWf9
	ls/5GavN94NxNA81zM6hb6I0LSBJDx2+Y4KDWfJ4KJhj71FY/wo7tRUvMesxrqq7dGLs7do8VeG
	O/tooSPoQdGP6X7dojoILpw2lqBzF6YzjjCyPr435OvCtgL7w+/IyS812aG8PHQ+uE/6NLhLmjy
	VAjmhhFU+CAj6MlFWtdquI1g12owXsFNL4Q35SuByCWcUwM=
X-Received: by 2002:a05:6a00:884:b0:72a:a7a4:9b21 with SMTP id d2e1a72fcca58-72fd0bc7cb9mr35652300b3a.5.1738654548568;
        Mon, 03 Feb 2025 23:35:48 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEmsqjymbrkDEMXx0uq+DnM18cYXX7nW3LMNz2qYbPHat/9yoLX1lbH8wOZSBS2srU+UJsmHw==
X-Received: by 2002:a05:6a00:884:b0:72a:a7a4:9b21 with SMTP id d2e1a72fcca58-72fd0bc7cb9mr35652258b3a.5.1738654548111;
        Mon, 03 Feb 2025 23:35:48 -0800 (PST)
Received: from [10.152.204.0] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72fe69ceb1csm9556119b3a.151.2025.02.03.23.35.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Feb 2025 23:35:47 -0800 (PST)
Message-ID: <fac29cc7-6407-d5ef-32f8-6c8baef1f37a@oss.qualcomm.com>
Date: Tue, 4 Feb 2025 13:05:44 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 3/8] wifi: ath12k: remove redundant vif settings during
 link interface creation
Content-Language: en-US
To: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>,
        Kalle Valo <kvalo@kernel.org>, Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20250204-unlink_link_arvif_from_chanctx-v1-0-675bd4cea339@oss.qualcomm.com>
 <20250204-unlink_link_arvif_from_chanctx-v1-3-675bd4cea339@oss.qualcomm.com>
From: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
In-Reply-To: <20250204-unlink_link_arvif_from_chanctx-v1-3-675bd4cea339@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: MWzgIAZ5NSd9n_SD9FwjjX7dBG1onbXA
X-Proofpoint-GUID: MWzgIAZ5NSd9n_SD9FwjjX7dBG1onbXA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-04_03,2025-01-31_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=813 adultscore=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 impostorscore=0 bulkscore=0
 priorityscore=1501 mlxscore=0 spamscore=0 malwarescore=0 clxscore=1011
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2501170000
 definitions=main-2502040059
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_233549_987572_97A4F122 
X-CRM114-Status: GOOD (  10.07  )
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



On 2/4/2025 9:53 AM, Aditya Kumar Singh wrote:
> Currently, vif level settings are done in ath12k_mac_assign_link_vif() as
> well as in ath12k_mac_op_add_interface(). Since it is vif level settings,
> doing this on per link does not make sense and it contributes to redundant
> code. Get rid of this redundant code from ath12k_mac_assign_link_vif().
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>

Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>

