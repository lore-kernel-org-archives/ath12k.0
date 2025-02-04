Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BA52C0218F
	for <ath12k@archiver.kernel.org>; Tue,  4 Feb 2025 07:35:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C8CC3DNaNwstjCL5UYvX2ni2+zBNkZ7cSI4Dr0j1vnk=; b=jQJE2fMcUAwePzRtffmIICY1v0
	yE1EuKwhYAIyob3G8ScKadvTYgBwa1DXlMfoH6xcHEIyGD7Vz6Uj2X9uHgNa7W3p+//3rHDayGc4z
	DptusnmrNlq0DV96qyCVmnMM+SPlH1OWs8LKlfE+Scy9u36B5SACtEj15YjqZ3ef8tKAK0GZBTiED
	UIAI9NhJ82caYhP0Rt/A8jwN8/1XFDMXIu3xi3jTUa25ZBfguTTx/Fcfe9C9IjiVm5m4iNLciQ+c9
	gUipEu1raq8z5/+ZFKFLqifbkHT6Fdfz9RIRVy3UPvoCDmtjDzZlAqDtJWgJ8fbSYskk6/dEVex7n
	DlQbsKVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfDSp-0000000HQb3-0SDB
	for ath12k@archiver.kernel.org;
	Tue, 04 Feb 2025 07:35:19 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfDSm-0000000HQab-1nYi
	for ath12k@lists.infradead.org;
	Tue, 04 Feb 2025 07:35:17 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5147HBoX012337
	for <ath12k@lists.infradead.org>; Tue, 4 Feb 2025 07:35:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	C8CC3DNaNwstjCL5UYvX2ni2+zBNkZ7cSI4Dr0j1vnk=; b=HVe2M62Gi7FCp1Eg
	xkDyMnd0EX9PAyRkjey7X980MzYXFE3PsrG1XG56MRgZVPciPAOyl0ibTu6/CkiJ
	QtPYLck2Vg+Db+NOOC9qqW7JkpoExK9TbPjec8WC0DxKxq4eXb4iXWIMM0yvpKtk
	cnX3Ru1OHMfXK+s+icundJ7T3c/i8yl7rAO+42ioqeqdLVxHwNjzhZLjGJKKohmJ
	1W81NE2WLTuAcA5Cwzh/5KgeAyqcelsoMy3m+hY5x6mSpNlJ0BrWkoHf9CZMHqTd
	PoG/rY2Hbx+SIULiGjX+iRJ2nt1E6w7vJzZL9B0V/IH4CvRtowfQ5JqbQBpxyUjR
	Qf2kWg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44kec40140-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 04 Feb 2025 07:35:15 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2164861e1feso108355615ad.1
        for <ath12k@lists.infradead.org>; Mon, 03 Feb 2025 23:35:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738654514; x=1739259314;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=C8CC3DNaNwstjCL5UYvX2ni2+zBNkZ7cSI4Dr0j1vnk=;
        b=ou7mrRg4V/Plh8AdRfKSgQkkBbOJTwxSN+7LO/yqSOvWlBd9uedjhdvB3yOrfeBXa3
         KekeVHIWaORIRjVOqRuSlMCdf1LqOobkSe/cL9Bsg1vOGmWI3aVzgoi3WU3aK+OhX049
         GHhX8uyIt30Q0fz0UfGQWeGen1iJ/6d5UA199VEo/FGFlcDvW0nhEIbNmWdG9bM1GW4U
         lF1pdqhWMTf/rov2SJAl5qRA8sfKhKFqMF1neYt0pPqKXTXxVODquZpg65cYO32T8yHv
         TR0tUn2khhW0ZxS/J4FDfAjN5VhyJ+ve9cDtKK3ZmHkQOvLXWVb5+efChBYF6xMDXemp
         lWSA==
X-Forwarded-Encrypted: i=1; AJvYcCVJoOWqSbN5JwqRGQ3mqhUfUZdpqEP6lwV+3etlc8Mrq+52jHNMS+gNjYTWeecvjEJ5XuIMJYg=@lists.infradead.org
X-Gm-Message-State: AOJu0Yzzsn7f/oZibrWcvn5Nc9cfCfJWK8rSlHv90K1wxHgkiVlrTpQ3
	G7BW3Z+Rmx+rtWDvPIzYq9rSEoVlwSkVNJm+pFber1g+t9xmQ8S1F2SU5uJ2maYJ1WEuu+FPeSE
	rtT0jctwh3gtfdxJiz0eJwU+RYD82Pqnl9Gpymsbki3DPRsJkuudKWiLVtVY+
X-Gm-Gg: ASbGncuLRYAISVOVXM4hNTiGxAyt+eLNkADrXYBV5QaWeJkSWzaeZ47I7PUWqEspWAB
	Zb4/DeAjrVaPCkAhtHz2EC6sUkziIX/B2MfkYIE2tN8JlXs7mhd1yy1OrSf5mNfBXIex8pcrhRo
	U/8fatqC2h+JHjsmAR4XvxS77Sp34u8ap6d3sSAV3lCWBqi98rAFxodrkubTaBY3VN4gsp98Pdf
	NtTruezns6OToN1wCoYSaavRSN62dQOCYOk5urue0MzX9vUSv/wUUh/lBrwla1IEMtOtBpJotng
	KR16PookMSk1P1X9leeoFqU8Q2kdBNfgd9jIMNwug96fZ0g=
X-Received: by 2002:a17:902:d4d1:b0:21c:1140:136c with SMTP id d9443c01a7336-21dd7c3558cmr363849585ad.3.1738654514271;
        Mon, 03 Feb 2025 23:35:14 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF4gw5bm/pgvM7hItOIb2mRVVbANXJ5lA/uYMkezaugLu7QXPhkzFwO5gbkOyIlpplWZcOdgQ==
X-Received: by 2002:a17:902:d4d1:b0:21c:1140:136c with SMTP id d9443c01a7336-21dd7c3558cmr363849335ad.3.1738654513798;
        Mon, 03 Feb 2025 23:35:13 -0800 (PST)
Received: from [10.152.204.0] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21de33032absm88861265ad.187.2025.02.03.23.35.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Feb 2025 23:35:13 -0800 (PST)
Message-ID: <18856414-c05b-a737-5567-e8669b2349a0@oss.qualcomm.com>
Date: Tue, 4 Feb 2025 13:05:10 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 1/8] wifi: ath12k: eliminate redundant debug mask check in
 ath12k_dbg()
Content-Language: en-US
To: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>,
        Kalle Valo <kvalo@kernel.org>, Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20250204-unlink_link_arvif_from_chanctx-v1-0-675bd4cea339@oss.qualcomm.com>
 <20250204-unlink_link_arvif_from_chanctx-v1-1-675bd4cea339@oss.qualcomm.com>
From: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
In-Reply-To: <20250204-unlink_link_arvif_from_chanctx-v1-1-675bd4cea339@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: zO1z-YK_Wcia_QsZSdRsRDUCA0gntVxb
X-Proofpoint-GUID: zO1z-YK_Wcia_QsZSdRsRDUCA0gntVxb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-04_03,2025-01-31_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=737 adultscore=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 impostorscore=0 bulkscore=0
 priorityscore=1501 mlxscore=0 spamscore=0 malwarescore=0 clxscore=1011
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2501170000
 definitions=main-2502040059
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_233516_488043_62041CAE 
X-CRM114-Status: GOOD (  11.35  )
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
> The current implementation includes a debug mask check both in the macro
> expansion and in the function __ath12k_dbg(), which is unnecessary.
> 
> Simplify the code by removing the redundant check from the helper function
> __ath12k_dbg().
> 
> While at this, rename the first argument in macro from ar to ab since the
> first argument name in the function __ath12k_dbg() is ab.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>


Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>

