Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2738CD2C56B
	for <ath12k@archiver.kernel.org>; Tue, 22 Oct 2024 15:07:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-ID:Subject:References:In-Reply-To:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4j0TSrcG4+GrKDdFhSudIfWhVj2QOoPGryroBU7BN2c=; b=nU4BR+oOAnjy51BIosk53bwxER
	uYURU6Aoxkr1nCEGteRkgPasUtJ+QEO49y+tU4Unqi2CWfgIcmxIKqCWiPBcPdAw0SHuOqCbvpflS
	kLOjPxpNH17WsUnYp+tZQZdAn5fdmOWGjDsjyojP9BnpkCcGZvqjvQUZwl85IU8t/VLYb67dT6fnQ
	BohmFu4trjce/HmiM0kbHqvfyRqB8EnESHlvFXgUMcS5eCNqT5mpkwmhxgTS1eKXHTN6kFe96/Bsi
	vNAXwoH9RbnQT8XA93Rv4aodGmw25EaI+LY1sH+nhqcYt4yfv5TZ5aXwd5pEuifeYIZKmm5sFTaFi
	spZnWtpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3GTz-0000000BCjC-3GNI
	for ath12k@archiver.kernel.org;
	Tue, 22 Oct 2024 15:07:39 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3GOa-0000000BBn6-1fnz
	for ath12k@lists.infradead.org;
	Tue, 22 Oct 2024 15:02:08 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49MBpanH023780;
	Tue, 22 Oct 2024 15:01:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4j0TSrcG4+GrKDdFhSudIfWhVj2QOoPGryroBU7BN2c=; b=XveL2wVQGWVvDPvc
	byij4+QOMdto+5SsR2HsbnHIxPUFV6JZKintrjw6Z9AHPV5mofyGRQZCaYl1J6cO
	j5JGKuPLIPhGw9XctqyhwFRUgPudXX8tJXzvuHIaaYsUIi3SkaPe9KBO/mPsW3K0
	OItknDCyfFUmgZq16txtpdMZld42tu3/zy6pcCEWDiULZGxYMkbAzdE1ZKmcNqbv
	zEFuWakkBVExT+MtLNeRtWkPEMqvkg73WrCDFZ6/l1WqWontnkBeF894dH23U8G0
	gYaH2RBKaM686aHvfM5G7jVZAY4wEQ4olh+vCqW+U4BaDp4cxgamN6Pj+fUw6kTx
	BZAyqA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42e3cgj24t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Oct 2024 15:01:57 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49MF1t3R019415
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Oct 2024 15:01:55 GMT
Received: from [169.254.0.1] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 22 Oct
 2024 08:01:55 -0700
From: Jeff Johnson <quic_jjohnson@quicinc.com>
To: <kvalo@kernel.org>, <jjohnson@kernel.org>,
        <linux-wireless@vger.kernel.org>, <ath12k@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        Jose Ignacio Tornos Martinez
	<jtornosm@redhat.com>
In-Reply-To: <20241017181004.199589-1-jtornosm@redhat.com>
References: <20241017181004.199589-1-jtornosm@redhat.com>
Subject: Re: [PATCH v4 0/2] wifi: ath12k: fix issues when unbinding
Message-ID: <172960931548.3037585.16411259457657952070.b4-ty@quicinc.com>
Date: Tue, 22 Oct 2024 08:01:55 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.0
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: ukR6yyaYn5pRdcw48nrbrIDbsGSgoGCJ
X-Proofpoint-ORIG-GUID: ukR6yyaYn5pRdcw48nrbrIDbsGSgoGCJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 mlxlogscore=479
 spamscore=0 malwarescore=0 priorityscore=1501 lowpriorityscore=0
 phishscore=0 clxscore=1015 impostorscore=0 suspectscore=0 adultscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410220096
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241022_080206_976705_3995F264 
X-CRM114-Status: GOOD (  11.56  )
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


On Thu, 17 Oct 2024 20:07:30 +0200, Jose Ignacio Tornos Martinez wrote:
> wifi: ath12k: fix issues when unbinding
> 
> Currently, ath12k driver is not working from VMs but it cannot be unbinded
> either from there. I would like to send these patches to fix the issues that
> I have found in order to get the unbind operation working there, at least to
> fix the errors found during the process when the initial error is detected.
> 
> [...]

Applied, thanks!

[1/2] wifi: ath12k: fix crash when unbinding
      commit: 1304446f67863385dc4c914b6e0194f6664ee764
[2/2] wifi: ath12k: fix warning when unbinding
      commit: ca68ce0d9f4bcd032fd1334441175ae399642a06

Best regards,
-- 
Jeff Johnson <quic_jjohnson@quicinc.com>


