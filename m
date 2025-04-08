Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF148C369A4
	for <ath12k@archiver.kernel.org>; Tue,  8 Apr 2025 16:19:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=18Jdjy1lIDqxR48lbXfj7ebOVzAt1zWbyiJblhbXmrg=; b=3IYoMI+gOO6WSktl8L6ojyOq5a
	sKbLxvdS1SDW331xNE+rMbJf5GnAjDMiBCGW9lWczK8m8zKDz6OD1uqYhHurDjNUEWXBSRwwk5bDc
	a6Nf1WqwIa7a5v4rvKSLCXJxTm8JH0N1aa6fhCnrPT8gHzFzlWYwkz858ZW49r5XiWKdr7hzVLKXO
	SazAZWF8DjbciF2C/JKfKYrIGS5GNOqiKsz3dVnpmVQHrw3eW4z+uQ/NOTjGisIho9jfDQzVx/7fL
	oRD5e1+EraJUAeLfiPjoOqCXDhyeZtq1VEuDzN2DfrnQwUkDNlQ9BDiyRsD7Cq4MDc1Q6ckMnG+Xm
	ciJDn7IA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2BfC-00000004n0n-2848
	for ath12k@archiver.kernel.org;
	Tue, 08 Apr 2025 16:19:02 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2Bdf-00000004mgL-1NPg
	for ath12k@lists.infradead.org;
	Tue, 08 Apr 2025 16:17:28 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 538BEkB4015096
	for <ath12k@lists.infradead.org>; Tue, 8 Apr 2025 16:17:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	18Jdjy1lIDqxR48lbXfj7ebOVzAt1zWbyiJblhbXmrg=; b=Pr/2o+T2AJWIANUB
	hjsOWEzg+ENYbQZivXpM2TYLiXT/RVIy29I+nHMncuoSHYwGtXhWebERD/e7u6Bs
	RV+nPlUUZRrD1Ie7VtOaakDn6ukjL62/jEFprIlXCeHp952Ew2yUubGvEuEd8eZc
	5TJSBf5lTkEz+3rwjNDUPob723OXg+iKFVcEZk9XOpyvPQvyzf9HMAkQlOhi/YOs
	VZ11asVQT1G34crFy08214QgV0EK9b281mc708FV6GaxwcCAsFEx4enhRtZwg2zD
	7BVRMxqSFnkGcwTvuw8T8PVmdFfdpNOUsrwIfmPyzgmfUf3ICJddVVMAT46aFBqz
	h/LKlQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twbugebu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 08 Apr 2025 16:17:25 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-7375e2642b4so4229597b3a.2
        for <ath12k@lists.infradead.org>; Tue, 08 Apr 2025 09:17:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744129045; x=1744733845;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=18Jdjy1lIDqxR48lbXfj7ebOVzAt1zWbyiJblhbXmrg=;
        b=XJ8JoUz0FulIBKGUNXXzbf4D9SYE4QktMZp9ZSkgGDrXUrhOeJzSkSngm2vQqz8KP9
         jEKSUHSJ/nlD1CWwsZrreJoyfHONNfjNmQylr4YNdNk2NMoTRf+8ngWPizwvipfsqf17
         f3pexe/GEpiwYdZq0VfzJWHEmf10KrpoUU6Ym5jQlXP1RPp9x/Rbp7n2uOR2Ej2K9omr
         tCQgYCRf5lDWOMRDSVHds85LTbtxzemPy3hPfrM8HHiUqpAIoofaXRdbDWd6qeOtWWM/
         /ZJpQHUQS1Haw+zCsZtIffRbPDqrul9VtNBzb2Fd7qOl5jE2b9/tizNq70DYsjEagO2s
         Sfxw==
X-Forwarded-Encrypted: i=1; AJvYcCWZad1aaiJfxrSAMcbVyPYhGMRY1EiNo4r+SnUbR/a58SSLrmfvL0MmbGN0lwlvHEK7bIanOsA=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw8suwhbNEVhjndUlaX5Fv5V1CK379qdvkoPZ3d00VVPOiWmWiD
	0CfSjpAEloIYF5HxNr2HcMyPVg7Q3ujWYvkc8Fwui6PlotBvhFrO78hZiX1ti3Rd2xcNIA6p9pU
	iR+25Q3QShMM5cSondnvETd1h53GCkC0dZ6hMNTgQ8G9vT7VygB0si6tsAcTq
X-Gm-Gg: ASbGncthkrJ1Zvdb3w+F6cRzidL5hX5h6jdJGoVpNlwOtuhTvRQcApRQGUr7ndXRflP
	5qB7xadyabJ6/Wd8g7KthE5H5dT6x6qqu0V4ZVROpblKS0q6uL0SCkXz9GDRLEG08yWvyRqlfK/
	x62tE9YXGpuNg6WCczoRhrg9I5YLn/UYmJAtOsJdE5ZT+o0MO5GRxYvsDI2gjMmfrGd5qnVkIh9
	OO09SIit8aX/DNBe0Guei13PPYB+2/bxqs+yK2pGWrulv0mjtF5PuVpqRek37ubcQNow5ptQQUN
	K0QceD3TroVv88qq3ye1KvFelBhiIrKiufK6QNxOgvyfOca5YGY+iIiS5T6KQjqrPeyWPgM=
X-Received: by 2002:a05:6a00:1411:b0:730:927c:d451 with SMTP id d2e1a72fcca58-739e4c0ccc3mr24526646b3a.20.1744129044421;
        Tue, 08 Apr 2025 09:17:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGJZdKS/o6NN6Q4KWocquKtvYVNzy+D0M8LQwJcJbyDtel4rJpvz67ulbdOI7/T5HoHSsQK+Q==
X-Received: by 2002:a05:6a00:1411:b0:730:927c:d451 with SMTP id d2e1a72fcca58-739e4c0ccc3mr24526570b3a.20.1744129043635;
        Tue, 08 Apr 2025 09:17:23 -0700 (PDT)
Received: from [10.227.110.203] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-739d97ee6besm11119301b3a.54.2025.04.08.09.17.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Apr 2025 09:17:23 -0700 (PDT)
Message-ID: <4ae387b2-0dd7-413b-b66c-1f136455e23f@oss.qualcomm.com>
Date: Tue, 8 Apr 2025 09:17:21 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: build failure after merge of the ath-next tree
To: Stephen Rothwell <sfr@canb.auug.org.au>,
        "Dr. David Alan Gilbert" <linux@treblig.org>,
        Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@kernel.org>
Cc: Jeff Johnson <jjohnson@kernel.org>,
        Balamurugan S <quic_bselvara@quicinc.com>,
        P Praneesh <quic_ppranees@quicinc.com>,
        Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        "ath12k@lists.infradead.org" <ath12k@lists.infradead.org>
References: <20250408105146.459dfcf5@canb.auug.org.au>
 <Z_R2lEVjqn2Y3_sP@gallifrey> <20250408113747.3a10275a@canb.auug.org.au>
 <26cafcbb-6a94-40ab-aabf-3c9943cfb925@oss.qualcomm.com>
 <ee51a503-6580-4f46-aa38-77f1b9ba6535@oss.qualcomm.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <ee51a503-6580-4f46-aa38-77f1b9ba6535@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Nva00EDyAxskENf8Yvgp5OdsIZVtVUNr
X-Proofpoint-ORIG-GUID: Nva00EDyAxskENf8Yvgp5OdsIZVtVUNr
X-Authority-Analysis: v=2.4 cv=dbeA3WXe c=1 sm=1 tr=0 ts=67f54c15 cx=c_pps a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=vn2k7iJgzrTi_hPdtGYA:9 a=QEXdDO2ut3YA:10
 a=-FEs8UIgK8oA:10 a=VxAk22fqlfwA:10 a=2VI0MkxyNR6bbpdq8BZq:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-08_06,2025-04-08_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 suspectscore=0 mlxlogscore=499 phishscore=0 mlxscore=0 spamscore=0
 malwarescore=0 clxscore=1015 adultscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2504080111
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_091727_379588_EB00B10D 
X-CRM114-Status: GOOD (  10.32  )
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

On 4/8/2025 8:23 AM, Jeff Johnson wrote:
> NM. Since the timer_delete_sync() API is already in my tree I can make a
> one-off patch for this.

please review https://msgid.link/20250408-timer_delete_sync-v1-1-4dcb22f71083@oss.qualcomm.com

I'll wait a bit for any tags to accumulate before I merge into ath-next

/jeff

