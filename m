Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34F1FC0218E
	for <ath12k@archiver.kernel.org>; Sun, 26 Jan 2025 18:45:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Qjzal2VIOLOUxu2o2XRhtZzepAUsS41r+vnYJ3dxxdk=; b=gWSzAGL0CUrjCeXEG5MSts7C0f
	ZbDt5VBWld1KFqKaWr+6kCp0HJqSoK26MZ7Ujakvd1LOFO8wofAIIVTnuE1ND2QOGKZ2T4JssdbOR
	s6PyWc8rOI/5T3JYDMQzEeukFI9E9KuWTGvW89W8QBmlDdE0/x1I6KZGWB+FX07cf/wyj+JvHodVa
	RtTXVBTNDJYVDfkDFGfgL7fG12puwRRWGpnv7EcSb5u6mR4mX8RbPACIsownxImhsP8AbMt1W6aKG
	2nnkDg2vM2oIBjnJJBMTyzbkhEtKroZiWGK5cPyuo95wq4eGN58QWn03Jkjq0a4i8osY9FeBcv611
	D+IpoWBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tc7d4-00000000eue-3twJ
	for ath12k@archiver.kernel.org;
	Sun, 26 Jan 2025 18:45:06 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tc7d2-00000000erW-1tpJ
	for ath12k@lists.infradead.org;
	Sun, 26 Jan 2025 18:45:05 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50QDj7p9012239
	for <ath12k@lists.infradead.org>; Sun, 26 Jan 2025 18:45:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Qjzal2VIOLOUxu2o2XRhtZzepAUsS41r+vnYJ3dxxdk=; b=CRVzeh5AUa0THa80
	MMf1c6u3Wh/nEIVPAAq6P70X/ZVgxnY9mq/9uyesq+wb0fWdOoo6X2bgvFNCfj8S
	SWx4rSnhYVmxYb/NnruE/t2h0JhSpScf1r8gZUklrWVCPHI0YRerU6rjHJN1hvFk
	anyPZ+mE4rkBm/Xweo+b+BT86dBopgF/ABnm5iTuIbSrhuhy/PAEV2qQU1VRcEJb
	gVmZeJgHPDhb+1PaeCfseIhX4RiFmII3981TEt9k4xJ2EwvFLWNRhKDqQV7dZKtT
	WOYp3ZKGeo6KbCE6A8qd2+wDblUXBrZnx0KrpK4zb12ZU0NHAZXvCB0n+CjeASju
	Fkn2XA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44cs4jt5w9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Sun, 26 Jan 2025 18:45:04 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-2ef79d9c692so10684694a91.0
        for <ath12k@lists.infradead.org>; Sun, 26 Jan 2025 10:45:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737917103; x=1738521903;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Qjzal2VIOLOUxu2o2XRhtZzepAUsS41r+vnYJ3dxxdk=;
        b=ttT5qyO8RMlZBGsVPE0MBUpBwWyRIYiS4rOlVlbFrBaiknS2bZP1kO1GLD6+VLWeM4
         9B0Dg3oPQiM1OJo4jGH+vEx1SBBE/gAM8Gqxi/27rxVQRjPsaz3B//Di8zflJHNMuqWa
         snSeMeA+CrfupGJXo01jD+6aK7y18zgTm9wcQZu0W6vbsIJh4QhCF0DOyCQtfyZdmuuJ
         EkkPXxTQo/REf+vZ9z0O3jxzFoSHCMRQFw0rs2DmWGFzxnACmnW24SGzrwpE1f7XeFrT
         BIK66npb/jzzvBEdaNoGEJpdVpEy/EG8qAdZFDO0rnvXrlALvDxXW4bprvkRK+ef2pma
         nO7w==
X-Forwarded-Encrypted: i=1; AJvYcCXXc84JVZ7kFoGB0MrbSg8Dcz7OPf3aKQPmn6gIOeq36l09lGmWOTk8xjU6Yz42P2bQGqWPCqY=@lists.infradead.org
X-Gm-Message-State: AOJu0YwAos02AEMBbhsO1sshr1wToPxRQ1zsiGbh5XEVaejZzaR+iZIu
	/pkj9u6Vf/+4VCbJaIMpmfYZgpgnSQzq+lsf9IiZM4hGEpZlKFJyC6xSx71F9pccxnWjZkkfORC
	V1df+4ToooI5Np3/Jrm9GWXd659mvMMl67oQeEkv8WZdcKvoOhwYLZ+Mi3U7w4ui/0FMV
X-Gm-Gg: ASbGncvamEH+3N/GSA3GXaJFQbVfgRBbXM5jHrDfH9GKx9xW3XKldnE+dRIECwUj6RT
	JBzBLXsBJ0p/hhzeMingn7lUg1bVxZT/GFelHFccRA8jrkabXww31Qe8AfAosm+RK3VsHsods97
	spnp3mEyOhYv+8qWIhMjqo1FtBRCSg1SU+VBhUzUuMYxXD7eMipAP12SOyYmamaGw0GM3TvF5j8
	ZZEFySxDuS3LxGndnNKv3EiyQK5uHKXX57T2UKT+GnjW2uYb1V+EjEWsnfYJVIwMBkL4R9cZ/OK
	Nc0qX4IUHskOZopdkNAw0gilvFjXnf+Pb4EKtNKYPw==
X-Received: by 2002:a17:90b:5244:b0:2ef:2f49:7d7f with SMTP id 98e67ed59e1d1-2f782cb58c3mr63741836a91.18.1737917102950;
        Sun, 26 Jan 2025 10:45:02 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFVDOJEal9qItKa852YUinKUBKEPgqodT6CK191Nxz1C3J8NiQdSjFfGQ7fvaGxYTmh6kkv1Q==
X-Received: by 2002:a17:90b:5244:b0:2ef:2f49:7d7f with SMTP id 98e67ed59e1d1-2f782cb58c3mr63741810a91.18.1737917102649;
        Sun, 26 Jan 2025 10:45:02 -0800 (PST)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f7ffa44cb8sm5414795a91.6.2025.01.26.10.45.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jan 2025 10:45:01 -0800 (PST)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Kalle Valo <kvalo@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        Vasanthakumar Thiagarajan <quic_vthiagar@quicinc.com>,
        Bhagavathi Perumal S <quic_bperumal@quicinc.com>,
        P Praneesh <quic_ppranees@quicinc.com>,
        Karthikeyan Periyasamy <quic_periyasa@quicinc.com>,
        Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>,
        Aditya Kumar Singh <quic_adisi@quicinc.com>
Cc: Kalle Valo <quic_kvalo@quicinc.com>,
        Balamurugan Selvarajan <quic_bselvara@quicinc.com>,
        Carl Huang <quic_cjhuang@quicinc.com>,
        Wen Gong <quic_wgong@quicinc.com>, linux-wireless@vger.kernel.org,
        ath12k@lists.infradead.org, linux-kernel@vger.kernel.org,
        Sathishkumar Muruganandam <quic_murugana@quicinc.com>
In-Reply-To: <20250107-add_max_reg_pwr_in_scan_ch_list_cmd-v1-1-70d9963a21e4@quicinc.com>
References: <20250107-add_max_reg_pwr_in_scan_ch_list_cmd-v1-1-70d9963a21e4@quicinc.com>
Subject: Re: [PATCH] wifi: ath12k: encode max Tx power in scan channel list
 command
Message-Id: <173791710099.2935553.14215933138966631965.b4-ty@oss.qualcomm.com>
Date: Sun, 26 Jan 2025 10:45:00 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.0
X-Proofpoint-GUID: -bwS9_llf99gynRQ2OTdY-VhHLGLFGTd
X-Proofpoint-ORIG-GUID: -bwS9_llf99gynRQ2OTdY-VhHLGLFGTd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-26_07,2025-01-23_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 mlxscore=0 bulkscore=0 phishscore=0 adultscore=0 spamscore=0
 priorityscore=1501 impostorscore=0 mlxlogscore=999 clxscore=1015
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501260150
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250126_104504_501726_177E21D7 
X-CRM114-Status: GOOD (  10.42  )
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


On Tue, 07 Jan 2025 09:31:39 +0530, Aditya Kumar Singh wrote:
> Currently, when sending the scan channel list command to the firmware, the
> maximum Tx power is not encoded in the reg2 member. This omission causes
> the firmware to be unaware of the host's maximum Tx power, leading to
> incorrect Tx power derivation at firmware level.
> 
> To resolve this issue, encode the maximum Tx power in the scan channel list
> command before sending it to firmware.
> 
> [...]

Applied, thanks!

[1/1] wifi: ath12k: encode max Tx power in scan channel list command
      commit: 07c34cad10ab0ac8b06ede8a7fbc55ecf2efa3e6

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


