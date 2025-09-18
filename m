Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D31DCAC59A
	for <ath12k@archiver.kernel.org>; Thu, 18 Sep 2025 23:47:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sfBCOxsmUp/2/EBHlsYVe+MbALmMUe6mc4/e76b2WE8=; b=G//IE5IatvyteWhz+SnrCrXmyI
	1JjaD5bcBUILBW/aFPKm6bzqyyn3Sg/pAg9g6jUjGZoYdW0wfC7EsURpMhebLdnZNEz0JBGPwogLh
	TxJlHTBStZ3ccJk2MtqHeJeKo4+JYn2aI8RI1ew6a78Res+nf+4XSYqfhTW1DW1yYzNRpyMl9Qlz+
	QWyqn1xR1pGeBHsaOBm1npgf6CcIgT4+wmq72q1LBEMtL9VcXKKHsiUupD0Grz+yMOUKYZ8DdVeI6
	k/pOvg1oDQhYxECTkmUbz1osOZOf6SfR/uX3KzUI535MLhvHWG6wvYTkbFT6FZ/HMihtNVZYGLor/
	jyzFx8Fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzOLf-00000001RwM-3c3T;
	Thu, 18 Sep 2025 23:47:35 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzOLd-00000001RsV-1Ngy
	for ath12k@lists.infradead.org;
	Thu, 18 Sep 2025 23:47:34 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58II4NHJ032434
	for <ath12k@lists.infradead.org>; Thu, 18 Sep 2025 23:47:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sfBCOxsmUp/2/EBHlsYVe+MbALmMUe6mc4/e76b2WE8=; b=pgaQoYQ3O9pJSf9S
	9BuIB+FCVNZ0u9I/8timtMSJZFLv1QTxkvexG/POe+Yh5tFf74rFkRd6bCxKWhlj
	uo2Vw+kuyjRwtS1eVwOR9/qF7OP+Oq7uvoxigNgxWzk5zeXJkfWVBlHd+KTxwL3D
	bk8oMUnjtcpSRBAwDK6DbQf33tJ+ZoWRkKAPuI/kcVQnnfoQ+IVJHF1SRP+frMrI
	v7ES1u6lRKCtDtpzUCp3Ty4XfGfSaXLcQHCteRem0DriO+i12Xa6jlfhoeI8mgOC
	L6AhNFndlYmC/7AuziEyVpYR5fakPY9z1/UGon9GH8BWTVAEs2iPdCOsX0SxI/Ji
	die1Ow==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 497fxyrd3u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 18 Sep 2025 23:47:32 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-269880a7bd9so14712625ad.3
        for <ath12k@lists.infradead.org>; Thu, 18 Sep 2025 16:47:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758239252; x=1758844052;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sfBCOxsmUp/2/EBHlsYVe+MbALmMUe6mc4/e76b2WE8=;
        b=Rx9/KrcolchpHc8h7stLo3LYXU9M7eDn2YNX0Zd9fvoFiFgu03NooYlZ5DXxO+vamh
         UaLgcAYk8r0m5Ade7BEe1Iu63ex5NG7FGvT7Xk45E8QjbFuGd7DGEVTIvTFuyr7qj8Sj
         NoIqB5Ab2EVo3IQq9k+bONX6O+QwU8hTpfKcADZN96+QVdJl1clQZ6YdOVIDcJQnCDNC
         Ec3u43Rr0sW/xgkUYiOcXl4Lnbq5KkgB7ybUTdCqYfttid6LGzGjSbGKZX6vS6EZt4nt
         dnK78KWk2KFYv5ecnhZY4F3IK3s3Jjnuk3jITfQ3hHfYt5QW0B1FoMOsZpEpxUEC1GCw
         AbMw==
X-Gm-Message-State: AOJu0YyoolxQP43jfdWrtacjDCMfywiyqd/ckNi4/Vi+3mUj5dYFnezf
	Ns07eNDy3z1TW8qkcngfXmaWaDqTbFOtDfSZrSWMZsndaSW9Kk4PQvR+Gq9Ci3qRgod6mvBryW+
	25S0HpdR/fAxcvxKbQbPy/WrECdZ7TSnriBYlWmJblyLbzKkmJNTBP2Qrz80HfPFJky7wDGmC
X-Gm-Gg: ASbGncs4sODxZ7iHq/QTmyPOVbOFPU/bCsbgWsIx5e/BfzfJwPhY1PO8fHv4hparHmY
	XwlNJjmzsYbM55m5OTAXcXF+h0aVjDnRpAbR1PCiFEKysuXDO27oW1acmGG/XS7Dn4u9btmBfxV
	9gVXQ1nO0kBs8TXuktQq/VdSvteqEkIE+FjAd1BgDmDXbYe/x5dW5V2yfedCNbx2Wj6kzhuFuDT
	5h7SKxOpniPUZs1nJDHVqI1R64Tsp2SEoDB6sgV1qEp8QZ7OA01ZAcj1K0wRul01I9i8PzPxwPd
	M8kQxdRx1cl2YujWlUb4MVAWhLVV/qJpQ0/CpTXvGcfNLSJeum+3RsICUU5vQoGRulUWXw9OoCQ
	b
X-Received: by 2002:a17:902:e852:b0:25e:5d83:2ddd with SMTP id d9443c01a7336-269ba53b173mr18945145ad.45.1758239251617;
        Thu, 18 Sep 2025 16:47:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFA3WQUIIMtpkiOihE1sln157kiET5utTKQK9PpBx3bINnG9HfeC03z+T6rglBJpRSFoZSttA==
X-Received: by 2002:a17:902:e852:b0:25e:5d83:2ddd with SMTP id d9443c01a7336-269ba53b173mr18944755ad.45.1758239250989;
        Thu, 18 Sep 2025 16:47:30 -0700 (PDT)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-269aa71c928sm16474705ad.107.2025.09.18.16.47.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Sep 2025 16:47:30 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: ath12k@lists.infradead.org, Lingbo Kong <lingbo.kong@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org
In-Reply-To: <20250812030044.688-1-quic_lingbok@quicinc.com>
References: <20250812030044.688-1-quic_lingbok@quicinc.com>
Subject: Re: [PATCH ath-next V4] wifi: ath12k: report station mode
 per-chain signal strength
Message-Id: <175823925027.3217488.12177583793625956584.b4-ty@oss.qualcomm.com>
Date: Thu, 18 Sep 2025 16:47:30 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=e50GSbp/ c=1 sm=1 tr=0 ts=68cc9a14 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=D-nDFYWG9Ph8EzAAE28A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: BN_2a1cQG_vza7MEdVwVpvmf-OmC5aLx
X-Proofpoint-ORIG-GUID: BN_2a1cQG_vza7MEdVwVpvmf-OmC5aLx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE2MDIwMiBTYWx0ZWRfX+/2soaza0HAI
 fEVKkbc3p9ByYVHFWOE9S6LpoSOd3SJX9fNBHFHnD9oWOGu2N8qzD1VCGqGeBwdRvYttm9Ef/1l
 FzQXjmWF6FdhaR+OU3oblV+gVWzRFv+RXmwFCNCeoyvXOQh1ZOhhkhS3HSmvIp9SUrbPv8p/pO5
 IJsa3nml29br8MW0GYdBHf2/tSvJHjruMMySWp9OjoyNOjl0x6kBPCEh7+Sj9L0+gchNTa3Owsp
 QumYoIYScjo/F1kcN5FkKXoXdUelLsXH2kvjbRXCWL7zYtLXp6rDGBfo1whKAVBpkLupvOSukiM
 pdqQ2iG0R3urVoPYz2/f8j/pMklyytJOEZB4MowI4bb7Z1upRL6BK+fVs0/GedUBD5kAJySLdjd
 Y0/bjFKH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-18_03,2025-09-18_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 phishscore=0 malwarescore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509160202
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_164733_373369_2F5D91A3 
X-CRM114-Status: GOOD (  11.63  )
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


On Tue, 12 Aug 2025 11:00:36 +0800, Lingbo Kong wrote:
> Currently, command “iw wlan0 station dump” does not show per-chain signal
> strength.
> 
> This is because ath12k does not handle the num_per_chain_rssi and
> rssi_avg_beacon reported by firmware to ath12k.
> 
> To address this, update ath12k to send WMI_REQUEST_STATS_CMDID with the
> flag WMI_REQUEST_RSSI_PER_CHAIN_STAT to the firmware. Then, add logic to
> handle num_per_chain_rssi and rssi_avg_beacon in the
> ath12k_wmi_tlv_fw_stats_parse(), and assign the resulting per-chain signal
> strength to the chain_signal of struct station_info.
> 
> [...]

Applied, thanks!

[1/1] wifi: ath12k: report station mode per-chain signal strength
      commit: 6af5bc381b36282bb90c649c1edcc3396a6cba99

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


