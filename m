Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA85CC02181
	for <ath12k@archiver.kernel.org>; Sun, 26 Jan 2025 18:18:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n18MrHgrKgwrqtPWhj2LmrDeeS4sdKPdEeNviTTZwog=; b=JsmtmnuhCrBjHgTu4aVtfpjxAG
	mGkCP8Y7wxisEtlEy97mnKF6Fw9qv+zUU5Xn2babehqF9KSQy8t8Im3s/iMrI+CqfMHIMtDC1JzgA
	2T+I25W7/aSP+oFe5aEpNXduUMuMGTOeLqH18ciHRhZP5UdZG7zsJ+5Y3yskksED5ofzYkz/GEEhn
	iA2ehP6I+mweyo/bb5P2faZxvUc9JJJaOTXYQo981waqD5RL7SFUKAmcMCiO7iV32VOiCk8JqO3Vx
	kSaROtF0XFaxCJU8tgNWodg2h9OzSnxhgCiFI8ZAqfiuXHj6h57CSfQkBu0XKyX61BbmOOBqMBsfc
	/OyxtFAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tc7DX-00000000bY0-1xMV
	for ath12k@archiver.kernel.org;
	Sun, 26 Jan 2025 18:18:43 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tc7DV-00000000bXi-0AHc
	for ath12k@lists.infradead.org;
	Sun, 26 Jan 2025 18:18:42 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50QHkU0q031091
	for <ath12k@lists.infradead.org>; Sun, 26 Jan 2025 18:18:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	n18MrHgrKgwrqtPWhj2LmrDeeS4sdKPdEeNviTTZwog=; b=NqiFy0d2JbPU2REd
	huQmo+6Uf4jqykQ3sZ03FL/0eC2ICgZCupvXQISFZ0+BObBjOH0Dicb2U2zOxTDR
	PSO87Itd5oRPXaGV1F3MKeXbH0EYLk6j2B/RfLgWLtR/8ecS4d3RBxScJC1tFDzK
	Lo9T2wEggrEHGM7d5VAsbFvHdFHvM8XfGC3bL8Y4SrdBM5tLtwWJLyCOL5TKdazW
	OyafzMVAG7p3tP5YNZjfzYI/Rl106wT+X8+2Qt04qzsonhoxqpjDnD0OoUutfHO9
	oKFEIQq/JqFqhNAyCndYiornmzDzRoNcol8K3XB8AP7H4e5GO8+tNZBmykvSqEkb
	fBvtXQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44cs3ej5qx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Sun, 26 Jan 2025 18:18:38 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-21632eacb31so45812775ad.0
        for <ath12k@lists.infradead.org>; Sun, 26 Jan 2025 10:18:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737915518; x=1738520318;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=n18MrHgrKgwrqtPWhj2LmrDeeS4sdKPdEeNviTTZwog=;
        b=bfcYXqyu6MfFY4dSn2gkY/ehq4zMtWCd6i0kmcNnVf+Xh0w91pJM5m7kPASOQoPN8v
         dZUPPplRBApywhUrSgdTXq6NeVLuKSHhAv4I2pAfWIbcj/lb+BI3oUCqtDcFMxwha5GV
         MhRvxNdKHFd8aPWZ5fu2bZiHIpNYjQY0pbhKCJZCZSE3uWoXs8cmaZyKaXQOKRnqb9b4
         oXWk2fayT1mfWH9H6+FrTn4n4ugPskL+NjNqtrzlJNgo+rlSvwzKqJnCLvjTB8nG8q6A
         2lEPJaA4HE6cOQ1V+pldpkCQp/HqJW9qgXy02vWcwwnUy/TXV2LZTP7dUeX/FN/ZghSv
         bhow==
X-Forwarded-Encrypted: i=1; AJvYcCUQC3Lc82JXSuoZREPpGJoJcIoaFbOb8168rKTqhrnJv/ievtAQ8RJBZAF0HQVD1rSOE6rD/SQ=@lists.infradead.org
X-Gm-Message-State: AOJu0YxuR2F1spod9qJfALaJbeZIffvnD+tuZkjxCyQdpoBgfu4yXts1
	mDN6W1gQJqSkyV/JnNpzjqHPk+XTWGoV2SjBNFR1hLIaYWBd/9DvhQB/quVHaZB2Qo81hS5hQuU
	qBBd18Uh6mvAJCR8DgrGbReYFXI2NPFiQFEHmq19Nw2QR1m7X3LANn+rr8Vqi
X-Gm-Gg: ASbGncsfq6B2sxSRQm+CRGSpV+mne7YPY2raf38Kx+83PD6T4JEJ7NTOz+ecNJgv3/r
	688IBcxVTRdrzIh1UsWjMAL6ObxSB/ZmdK5Ubww0Y7Z4evtixdqplARRPSeX+NHxZMC07RnZIZC
	a1ghIlLIXJ8BkNku6xTPo8KPraB0pvj0LL5+h2il6MlGnBZpRod1iSZISIGSFBniOuUJA0HVLB7
	y0a50QUhwFnKnuSMf0njfo7m2L8TkzVHNNplSeLikD5ls3YYRm8voYsTO3sDVjfdfbitJbv6d0Y
	G34hrYidkv41qaaA6M+7a2dPUjPlN7K1CAKPfvZBT+NYF3A157aFyKrTGi9QrUqzq5UY24OLxA=
	=
X-Received: by 2002:a17:902:f54f:b0:215:b468:1a33 with SMTP id d9443c01a7336-21c351c67acmr568099395ad.4.1737915517961;
        Sun, 26 Jan 2025 10:18:37 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH6iUX8NbSnxsln449HEGkc3CEazLXNaoOjmgCwQR6Arq+ZY1aLtahJRJnKwlkpTfiVoSAl8Q==
X-Received: by 2002:a17:902:f54f:b0:215:b468:1a33 with SMTP id d9443c01a7336-21c351c67acmr568099195ad.4.1737915517599;
        Sun, 26 Jan 2025 10:18:37 -0800 (PST)
Received: from [192.168.1.111] (c-73-202-227-126.hsd1.ca.comcast.net. [73.202.227.126])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21da3d9c52asm48731595ad.43.2025.01.26.10.18.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 26 Jan 2025 10:18:37 -0800 (PST)
Message-ID: <13df84fa-8344-4079-9b61-fc800bef33f8@oss.qualcomm.com>
Date: Sun, 26 Jan 2025 10:18:36 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath12k: remove return for empty tx bitrate in
 mac_op_sta_statistics
To: Aditya Kumar Singh <quic_adisi@quicinc.com>, ath12k@lists.infradead.org
References: <a4bdebd14f5dbec653b75277097917910344f244.1737142154.git.repk@triplefau.lt>
 <acfa729a-bf3c-4359-966f-1ff11002b949@quicinc.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <acfa729a-bf3c-4359-966f-1ff11002b949@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: ba18r42AFiLbepo03DmO88uMxDJF2Ku_
X-Proofpoint-GUID: ba18r42AFiLbepo03DmO88uMxDJF2Ku_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-26_07,2025-01-23_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 suspectscore=0 adultscore=0 phishscore=0 bulkscore=0
 clxscore=1015 mlxscore=0 mlxlogscore=954 lowpriorityscore=0
 impostorscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2411120000 definitions=main-2501260148
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250126_101841_087979_51876A66 
X-CRM114-Status: UNSURE (   9.23  )
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

On 1/19/2025 8:39 PM, Aditya Kumar Singh wrote:
> On 1/18/25 01:00, Remi Pommarel wrote:
>> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
> 
> nit: An empty line after Tested-on tag since that's not an official tag. 
> It is ath specific tag. But I guess Jeff can fix this in pending?

Yes, I can do that


