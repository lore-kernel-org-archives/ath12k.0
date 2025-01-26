Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5636DC0218E
	for <ath12k@archiver.kernel.org>; Sun, 26 Jan 2025 18:45:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5UMqbQmE5W9OIJQY3R/U8mQ+VTeXOdh2K3WVI34n92w=; b=gascKmX7cAE/sTyzl0GiwbuarT
	xUfrfpptM1+CYHcqDdkTkhmN9HBFr9rTbdMzAcEtAvWdO6YAbdWziSI4D3Jr/3RUfxPFde4CTBgCY
	TxGVA5Sm/Xwr3uA3rF7zbxVqGvmeQdqq5E0WJ7qnu8YlDcbJiCqh8CaLFD7giX/aq66EVeXi9V43d
	Th6SZc9ghYqTVO/nAtnxoOnOFhRIbDbVo38QGT2Szgp02uSdsv5TxwCPAiEwY0h5+Y71dfsxMvJSc
	McFPy5SCqkm6EtIyXENAx5S/RuiXPeBflWDtVMTVkcgiybNMXQi1iqgeeF7XzbfYk/bKJ7uY4euuz
	CBBh0LFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tc7d9-00000000f0B-0SRt
	for ath12k@archiver.kernel.org;
	Sun, 26 Jan 2025 18:45:11 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tc7d5-00000000ew9-48TE
	for ath12k@lists.infradead.org;
	Sun, 26 Jan 2025 18:45:09 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50QIRDCv003608
	for <ath12k@lists.infradead.org>; Sun, 26 Jan 2025 18:45:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5UMqbQmE5W9OIJQY3R/U8mQ+VTeXOdh2K3WVI34n92w=; b=coFiyUTVyqa3FwkF
	8fd9nSFhAnBNV7V9phscQlf1MbZpUlivBO0+6BmkttVhWBnRDkmi7nAXCrGR2eM4
	FrG/jiZNmEsJkfQIEbCysRCEQY8++7SPbYVq1ECMbmtEYydxA0RwQvbD6DwAM20t
	WW9I31HXugX6ZdNu4xdeaz3AH2k7WOQNJpd80co7A00NM0oIOL+Y7qsvnjam4SR5
	zX4pep6URYvgB20cTaAckQ3HgWjhG1NepKBypG0LpcLnzbfJuTVdS6FT19OLWCnF
	jpolpIeEh3eg8w2z7m5Y13GDxzr7OdAfHZyL3oIaC0aI9xTyortImAInWRC8mMi4
	Qj+36g==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44cs3ej6dk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Sun, 26 Jan 2025 18:45:07 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-216430a88b0so69627435ad.0
        for <ath12k@lists.infradead.org>; Sun, 26 Jan 2025 10:45:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737917106; x=1738521906;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5UMqbQmE5W9OIJQY3R/U8mQ+VTeXOdh2K3WVI34n92w=;
        b=eexQ8IAgFIo4/jaLg9tnr6LzD142IPACoMmffKkAQm+pL6cKMK5qhkC+SD+MaxymqA
         oQdWbs2fN9u8VwaoHflfXbgt6ut48doSf53KgwfZi2u27vJazOwZOWcR5FI43qFkQ3cd
         ktQYPe93cIpDB2O985mP9/Vcfx9MG2x1WDBqfd8lbfedBs4F7N7B+6hWh8gcVPt5sUqn
         OowBB2iGJISFcZ9EC7DKiAah64NIfKmHScV6D1MglmzFrTOYefzBInrQjwEf7+z3IaQH
         OAjlZzVaX+9zGgOir3jR8TDDWCTCa//ctT/uLp8vB44dS0kFzmk+SfYo1WjYgKCgbLl5
         EHFQ==
X-Gm-Message-State: AOJu0YxWiJfiSo9j8yPd5hFMBkQK7Spcp78N4nSERVYvq0z7Rm647Ec6
	e2LpMVJRp5e+4OVVSRFC7BOp6MUHEThYdX2Oi8EFcT1DthRgzs96zssCPaCbTGMjYHH8v849xF7
	vaZVqyY8KdPZ3wHZlMPUX5m1/Q+ltovfnsVixH68qkiinO3baF9CeJGxnYPEnY2vrMjze
X-Gm-Gg: ASbGncvIXVJWAb16x5G7pO8F3TI5Nra+1uZSs0iQFJlhCVsr3t6gd7OqVKUSURmIuPu
	iAJPnjqzpyeG/x9SxkK5ioGTRvsklQyngkjMYKU7sfLoOvaun5/Wu9fZDkjTFouRBTPhjxWXsLs
	TccDLkI/nh5j3pDeVvRxdSWrm2LwH7mS0IVFSvayXJBdOAXSf+4YtCdkp1tw7Q4Nh/LG+x19Px0
	jl+qQhTkgM3E/48KYZgoOqhT0YF+44xyYim1AQIKU1xlZZeLi5phDuLtI2gX92L6KUEnjUPBYLX
	KCYfWcsxwLHB7vhhohXbQLIwFzSwZryx4XFsf9PPyA==
X-Received: by 2002:a17:90b:5208:b0:2ee:863e:9ff6 with SMTP id 98e67ed59e1d1-2f782c99682mr59663898a91.16.1737917106499;
        Sun, 26 Jan 2025 10:45:06 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF2RZtBLfmshFWcJEFgc0Jzs47/NjdG/c5PI+9IaQ3oE+skTajJ2ueNy5p8qV3lG/BLcuBhnw==
X-Received: by 2002:a17:90b:5208:b0:2ee:863e:9ff6 with SMTP id 98e67ed59e1d1-2f782c99682mr59663875a91.16.1737917106066;
        Sun, 26 Jan 2025 10:45:06 -0800 (PST)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f7ffa44cb8sm5414795a91.6.2025.01.26.10.45.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jan 2025 10:45:05 -0800 (PST)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: ath12k@lists.infradead.org, P Praneesh <quic_ppranees@quicinc.com>
Cc: linux-wireless@vger.kernel.org
In-Reply-To: <20241223060132.3506372-1-quic_ppranees@quicinc.com>
References: <20241223060132.3506372-1-quic_ppranees@quicinc.com>
Subject: Re: [PATCH v2 00/14] wifi: ath12k: Enable monitor ring for
 updating station dump in QCN9274
Message-Id: <173791710550.2935553.1026001360946365349.b4-ty@oss.qualcomm.com>
Date: Sun, 26 Jan 2025 10:45:05 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.0
X-Proofpoint-ORIG-GUID: DeniBjLyrebjH13TZJFYg0EvQUaakIGB
X-Proofpoint-GUID: DeniBjLyrebjH13TZJFYg0EvQUaakIGB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-26_07,2025-01-23_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 suspectscore=0 adultscore=0 phishscore=0 bulkscore=0
 clxscore=1015 mlxscore=0 mlxlogscore=643 lowpriorityscore=0
 impostorscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2411120000 definitions=main-2501260152
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250126_104508_032892_F04E9BBF 
X-CRM114-Status: GOOD (  12.56  )
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


On Mon, 23 Dec 2024 11:31:18 +0530, P Praneesh wrote:
> This series enables the monitor related rings for the QCN9274 and
> configures filters to collect statistics such as RSSI, which are
> required for updating the station dump. Also, this series does
> not impact WCN7850.
> 
> Depends-On:
> 	[PATCH 0/3] wifi: ath12k: Refactor monitor Rx handler
> 	https://lore.kernel.org/all/20241219001006.1036495-1-quic_periyasa@quicinc.com/
> 
> [...]

Applied, thanks!

[01/14] wifi: ath12k: Add HTT source ring ID for monitor rings
        commit: dbb73909eea3e89437296d75675e84fcd76a418c
[02/14] wifi: ath12k: Enable filter config for monitor destination ring
        commit: 9b0d8fb3326b32a11981a3ac6fa4ddf97248b8a6
[03/14] wifi: ath12k: Avoid multiple times configuring monitor filter
        commit: 6e8c9ba7f0308ba2a88270cec6ce7e8ef621df1f
[04/14] wifi: ath12k: Avoid code duplication in monitor ring processing
        commit: 39f1d751d2ae7050ad9b88560fc2042515dc88d5
[05/14] wifi: ath12k: Restructure the code for monitor ring processing
        commit: cf544270c7392af1dc3a3bf405b902f3b9d3f925
[06/14] wifi: ath12k: Fix invalid entry fetch in ath12k_dp_mon_srng_process
        commit: 63fdc4509bcf483e79548de6bc08bf3c8e504bb3
[07/14] wifi: ath12k: Fix end offset bit definition in monitor ring descriptor
        commit: 6788a666000d600bd8f2e9f991cad9cc805e7f01
[08/14] wifi: ath12k: Add drop descriptor handling for monitor ring
        commit: 51ad34a47e9f261d03894b49a734174c170b326f
[09/14] wifi: ath12k: Handle end reason for the monitor destination ring
        commit: 8520ba9bb8f43ce9d540d9be6a5711ceeb1651cf
[10/14] wifi: ath12k: Optimize NAPI budget by adjusting PPDU processing
        commit: 394a3fa7c538060ee3cb134d52b4e9ec1f680cac
[11/14] wifi: ath12k: Handle PPDU spread across multiple buffers
        commit: 67434640e52256efd14260cb8edbea41c1faef0b
[12/14] wifi: ath12k: Avoid memory leak while enabling statistics
        commit: ecfc131389923405be8e7a6f4408fd9321e4d19b
[13/14] wifi: ath12k: Handle monitor drop TLVs scenario
        commit: 3bcc4e830e05ed604bbba89c5415926df4ccabae
[14/14] wifi: ath12k: Enable monitor ring mask for QCN9274
        commit: 58b976e4f4b4d727eea27c0e40830853ef7ecf0e

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


