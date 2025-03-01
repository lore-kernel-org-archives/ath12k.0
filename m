Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCE1CC282CD
	for <ath12k@archiver.kernel.org>; Sat,  1 Mar 2025 05:08:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mvzvijPldS6tDkdWHeMF7h3d8VZDqRT0m/lKGfdkkcg=; b=M2YTMJ+apL0Ml5Yz69INkkv37c
	EtzWEnoNHePI6qFqRCGt9UQFhdiFcmKieoHALR1dfyU2KG2Dc9vmM8IqkOygi09mpLAoZVEKJi7pc
	9Jqo9eJI/P/Zw7gvia3iiHA9rxQ2rjKjaKRaJsgQMlsRo67+ZTkgCzkC7QIGdV70SGWEILc7BKt42
	DKnoFVFGTWiidbIbF91eHO9vjsYB2wva8un5SfmmqYQ01dgaZHzCM/x7mxGYVp4S0mZyy4sf+rnr+
	1gXeFemXWjnW5A7EEQhnUzdd2ymtFuK5QNWGmNSZsUx81Tb3OnTI9juIYvuypOv0tWo/IXJCXgCNV
	hcn5IDZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1toF5S-0000000DPyL-1jpq
	for ath12k@archiver.kernel.org;
	Sat, 01 Mar 2025 05:08:30 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1toF5Q-0000000DPy2-2Y0b
	for ath12k@lists.infradead.org;
	Sat, 01 Mar 2025 05:08:29 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5214BpSY027126
	for <ath12k@lists.infradead.org>; Sat, 1 Mar 2025 05:08:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mvzvijPldS6tDkdWHeMF7h3d8VZDqRT0m/lKGfdkkcg=; b=Df4PKkmhl+VutdiZ
	9YKingve/0nZ5w08LZeTlCUvSzVyVRXVtJw3AJP0yuZtITFEryqdx3X+qBv7Z80Z
	c6AjBsIV7fMjluOBSWBp96Fv/bY+P2+QYE+xkxtAFbxGnI2tUrHCoRFtGhte/AIH
	pngjogcsfiH0GnKwuautbRQUd5oy/26X78SRpBFH9LMTn0/rqtv3N9EO+6COj0ud
	Qgk5P9eInbjMqenzJjyjT49VyW6CuINoikcCJ2ZaJElSU+p6szNIHyTzGPv+iY1W
	PHc3YSTJrAG4wwOzQSe+EO13t4Ou+PFRoyxpeTClbjWQKhEktnA11aTVzs10vAWE
	tAyedA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 453u0d027v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Sat, 01 Mar 2025 05:08:27 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-2fe862ea448so8858050a91.3
        for <ath12k@lists.infradead.org>; Fri, 28 Feb 2025 21:08:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740805707; x=1741410507;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mvzvijPldS6tDkdWHeMF7h3d8VZDqRT0m/lKGfdkkcg=;
        b=vrnO1CBVgArocsVGS0ZOvv43p6AKRP+E0hGO0DEYdT4NgRm336Wg/T4ERnS9H0fjwQ
         /UmUzGY9hmbQi5t8EAc14/5fRFcdP1ZvWiQ2gFqGg0V4STC/+GLQBBpyqeX0z4tmTlM+
         5h3+5I6Kz+oyHfrXyjiY9We8XMu8YnsMCVe16vTEgHJENPej2D4dXzsz9yuR7djs2g1t
         6lhUakq5IKH9EQlC4QlEgFUbGBchKHDUGV31tGd+33iVOfeOS+veYSn3vz982ISHL1c6
         iP5/YNVtokLAOOupyBhKZFkqOOOAKMtw4U6tsUlDCo3ZEOGBHzo922jgRPAypVQB1A+0
         wX2Q==
X-Forwarded-Encrypted: i=1; AJvYcCVyrDQeQhcHdJaFaxQl/HQZPW3wE8eNiopsnxDfkyCTKmXkvtHjUdVN4GDw7O/lhWfXg+fdS0w=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz45tvD4sxxA1O7Yvxl+Xt1utQPR7XquURthJ9eVJNat9mTJrna
	Jx7Xt1c0P4+sqtyNO9i3sSmOS5e4PqL7+GPzlEXLK1/6mqLlYwoJwenWPStrb+Ppc0n6pac187i
	kUqCSpk6Z3svo21tm2AOYBvaIxTTUIXvD6Ek7vKaJrUQpTDQHOEW5vmCpIPBS
X-Gm-Gg: ASbGnct3X26F2SruPpB+tyR5IWzkMNNW9Y0v8Az5YEAb07jzIWPcJAAfx1M3pzXWH+4
	ffRPCaGmJs+T+GO4rDLqnwy+nbvK9+rdQEmsmhJTsAjT2E7lPNbnzTzdMoyNVYqOoZB9HYi9qj6
	k8OdRtAqVFygHeedrAdZBOav8jvYb6a+XBXxQIQNUa2PfMgwWvhyhpR9Mxn3EzPQGLBBiqSqZwD
	JRLMoCgpjSyyiEgW0kTYczjerNxNOKijAY2d3UpJgLk/Un9W+PaNcVjLOhpNX8Ic23U55EQ1CCM
	U+zcy1EhGqkkqKANUYMsxIQRwAqz1s3619wntqtEabaROaTgdzTkGUafUYet8Z4=
X-Received: by 2002:a17:90b:528f:b0:2fe:baa3:b8bc with SMTP id 98e67ed59e1d1-2febabedbe1mr7655062a91.23.1740805706972;
        Fri, 28 Feb 2025 21:08:26 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE/vPlqpHEUgI+a+2o/62cPS5Ifg2K1lLIxhz7aBhhW1sVlPf4mx/UX0l+6C4tO6IiJQGxbqQ==
X-Received: by 2002:a17:90b:528f:b0:2fe:baa3:b8bc with SMTP id 98e67ed59e1d1-2febabedbe1mr7655047a91.23.1740805706639;
        Fri, 28 Feb 2025 21:08:26 -0800 (PST)
Received: from [192.168.225.142] ([157.51.160.80])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fe825a98e7sm6858235a91.4.2025.02.28.21.08.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Feb 2025 21:08:26 -0800 (PST)
Message-ID: <64b6d4f9-429f-c415-4b4f-bec02f520671@oss.qualcomm.com>
Date: Sat, 1 Mar 2025 10:38:21 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v8 03/13] wifi: ath12k: refactor ath12k_hw_regs structure
Content-Language: en-US
To: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>, ath12k@lists.infradead.org
Cc: Johannes Berg <johannes@sipsolutions.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Jeff Johnson <jjohnson@kernel.org>, linux-wireless@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        P Praneesh <quic_ppranees@quicinc.com>,
        Balamurugan S <quic_bselvara@quicinc.com>
References: <20250228184214.337119-1-quic_rajkbhag@quicinc.com>
 <20250228184214.337119-4-quic_rajkbhag@quicinc.com>
From: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
In-Reply-To: <20250228184214.337119-4-quic_rajkbhag@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: jp0pEqG4WP67m8ka-P-VRRmPI_VzbbxZ
X-Proofpoint-GUID: jp0pEqG4WP67m8ka-P-VRRmPI_VzbbxZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-01_01,2025-02-28_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 adultscore=0
 phishscore=0 malwarescore=0 spamscore=0 mlxscore=0 suspectscore=0
 clxscore=1015 bulkscore=0 priorityscore=1501 mlxlogscore=684
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2503010036
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250228_210828_655171_E618FDA9 
X-CRM114-Status: UNSURE (   8.26  )
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



On 3/1/2025 12:12 AM, Raj Kumar Bhagat wrote:
> From: P Praneesh <quic_ppranees@quicinc.com>
> 
> IPQ5332 device have different register address values for the below
> registers:
> 
> HAL_TCL1_RING_BASE_LSB
> HAL_TCL1_RING_BASE_MSB
> HAL_TCL2_RING_BASE_LSB
> 
> HAL_SEQ_WCSS_UMAC_CE0_SRC_REG
> HAL_SEQ_WCSS_UMAC_CE0_DST_REG
> HAL_SEQ_WCSS_UMAC_CE1_SRC_REG
> HAL_SEQ_WCSS_UMAC_CE1_DST_REG
> 
> Hence, refactor ath12k_hw_regs structure to accommodate these changes
> in IPQ5332.
> 
> Tested-on: IPQ5332 hw1.0 AHB WLAN.WBE.1.3.1-00130-QCAHKSWPL_SILICONZ-1
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.1.1-00210-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: P Praneesh <quic_ppranees@quicinc.com>
> Co-developed-by: Balamurugan S <quic_bselvara@quicinc.com>
> Signed-off-by: Balamurugan S <quic_bselvara@quicinc.com>
> Signed-off-by: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>

Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>

