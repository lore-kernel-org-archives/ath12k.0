Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4AC8CA1005
	for <ath12k@archiver.kernel.org>; Wed,  3 Sep 2025 00:46:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xys+TN3UvtXkU8j0YAUEEAdyFeTetjbhha1tMZwRS4c=; b=wMB1ukFBkIO6mhnfJckpIz0p0O
	n0w20RPevjg2G9Gk3rufHCC+6wFyYapFysUygDvb83J4CvbW07cwjFsJWAPBcteKXAS57/S4O42aP
	h1qdYR2tE38sE8t4z5Fz+XSaQqCxb0L6K96eSSClXANkXZw/fiNrRWLbJYYriQwYPohRt6TAhGkky
	BTiFxhMJI9hhORalSUatK0qdtS0uoig4sIkf7D4IyDD6SERtX/avWyJNN979PDHHHm6Ps+yJuTm+F
	vuWDphgRVASnYhDdSkGRDY10c3fed5pLs/ge18t1ieldVT23Qo3EHGNNqG0sd6oUsVtgsESAVPELO
	JMrKtU7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utbeJ-00000002syC-0TPZ;
	Wed, 03 Sep 2025 00:46:55 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utZmC-00000002R0r-1WpK
	for ath12k@lists.infradead.org;
	Tue, 02 Sep 2025 22:46:57 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 582EqCJb021298
	for <ath12k@lists.infradead.org>; Tue, 2 Sep 2025 22:46:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Xys+TN3UvtXkU8j0YAUEEAdyFeTetjbhha1tMZwRS4c=; b=mlf/Ws90qxSd+3Oo
	lIYJhk4+Z99sfe1ZmBJ/tTEvBkBeEX5Rsn+KkyiU+YI2wewZNbyU6eFEfnrpaPFU
	lTzUJ10FtG1PR8eRSdfNcONsm0O8mykHhAERcc9WQq374DUoeyv/5Ptt8J67A7Ch
	mQDarlCNRcOrZ7FXubzdg8l3Jb8KCt5vDUIsdAQU3o7sqVUc79vcJni5SO2IwFFj
	4SQXszIg5zDdl2gb0s30A6gDf/R95sHo8kepEeiek1DJcP+qyp/VEXtK2vBu3r/n
	o+yeKsFib3nEebr4YQ6RsxvyUNyHlQ44VfuzED3fzX5CnRSqjcqJ5WjYxBQ7uj5L
	BSt9uQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ur8s1gup-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 02 Sep 2025 22:46:55 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-76e2e60221fso9668518b3a.0
        for <ath12k@lists.infradead.org>; Tue, 02 Sep 2025 15:46:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756853214; x=1757458014;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xys+TN3UvtXkU8j0YAUEEAdyFeTetjbhha1tMZwRS4c=;
        b=urzrVWfy0M8SLgGX2iuPDCi3rx4js4d3PDSjRZskoZvvjBLGa0yfm2xPmRzFwZbail
         kVgjDtEJ7UcGIQvIzF1ACzxBn+J/BiD5HiNknzP3+IjQyac30IF5/qr1Lt1GfCAX5X0X
         x/5pXyj20Yxe4gCZxQJb+tnVJQK5Cy/Hp33zs1zuoA9BGxv9iHOYfUMtmLaZsprufjRR
         gpz5v1t/bV0Lb0j+Y/J6PmybYgYYDLsQv/nfNSfJyZBOmjB/oMeSsYF0UwP2+QpEZAeH
         d+w21qE3740VWfILkkHd0opiEF57AV7sancCjviBRE7gJA2qI4o0ivjQiGQDQY00WNbN
         cuqg==
X-Gm-Message-State: AOJu0Yx3bYe2qH7xveT9TyvgtYOfE6e0EZoIouSJDhv0Q8ZgsIyj7awP
	lo9K65ABfguZ8QRnWAgztwufC2sXXKfd0HwfO4fSpMVjcuR5OE7OfnfJ/M/h2vEywocP85IhJkN
	c6SshjfPT0YkxxZEnOv4divWjo5eiBa6UOv6XNvxsMb8Z/WREQKYHWJsmYwwz9vlR
X-Gm-Gg: ASbGncsZjtCyP/jCwj2L80YCzG8nrXsJrrAmZbVjnzBfQOYAf2CNIN9hT8j+uXESC43
	wOPu6KnMuhThZ+rqBeNumYQQygmX17F607iO+rbLCalVovOryxBIJKQf7PsCIeddSGOd+dQY5FF
	KUhVDXjYF61WDiGK/84EQPihqJV6RlSMOHIqFzeGlCbLKrRowft8eHsWNDeGZQ7JOSqy2hK7/8j
	Ngs+OYuCNUtfue8hOPVPXSL6F5Fmf/C/Z55udpCHy4GQjj/e9hh7vCHfBEpQ0fdFCHl/6U26Mix
	O+2UvxTXDbHXFluW0vp5Ees+cVnRLAjd4m8etGeyrZnsS9Mt7XE2kxym1O0Z3Ip0mrQQ1RP6IAa
	J
X-Received: by 2002:a05:6a00:4b56:b0:76b:f7af:c47d with SMTP id d2e1a72fcca58-7723e21f31bmr19473705b3a.4.1756853214252;
        Tue, 02 Sep 2025 15:46:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEkIImkkPU6MxGr4gP6bIaLDKYFv2y3TCkwY7POopojn7hgisj16D0UfF1OYID2SsHnX63+ow==
X-Received: by 2002:a05:6a00:4b56:b0:76b:f7af:c47d with SMTP id d2e1a72fcca58-7723e21f31bmr19473686b3a.4.1756853213830;
        Tue, 02 Sep 2025 15:46:53 -0700 (PDT)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7723f4858e6sm11129947b3a.4.2025.09.02.15.46.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Sep 2025 15:46:53 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: ath12k@lists.infradead.org,
        Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org,
        Ramya Gnanasekar <ramya.gnanasekar@oss.qualcomm.com>
In-Reply-To: <20250801104920.3326352-1-rameshkumar.sundaram@oss.qualcomm.com>
References: <20250801104920.3326352-1-rameshkumar.sundaram@oss.qualcomm.com>
Subject: Re: [PATCH ath-current] wifi: ath12k: Set EMLSR support flag in
 MLO flags for EML-capable stations
Message-Id: <175685321312.3902096.17261701476797887312.b4-ty@oss.qualcomm.com>
Date: Tue, 02 Sep 2025 15:46:53 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAxOSBTYWx0ZWRfX5VHUtk/w5Nil
 kPQJON0+61xXxhZ3SDOrlKpl666pCgTpv7NOU/11ef1sVPT7d20MSLfockgobp+6DelCjsDvicd
 VGhQOWByQD53mKN1Zb06IgOvOxjI/XMEf6GGjNELNN2Iig0jFJzoz1mhjGpSTJ1CjB25xUDMaKN
 HLiQM1dXNrbFaPsc0JfB8aDxuE0ZqS9m3A8axeCwTy8vwuFd53umpIGidv4xELIbchUKEFhnI/G
 rbaLhNY4vMOPta/g7F9e6M4+Z/cA1i+mN3+lGyKCqNMd2Mhu3G31IKpG0GC4pVx7BBE5hCIqzrp
 hRlZtqUW3E3XsOoKRGk5pgiUmCsLY8uPsTVF8kXusTCnwZIbQUfkLKuluW/5FGaaB3HNQXY0edv
 BKaQ/Deu
X-Proofpoint-GUID: CV1nHLX-vtTiT67KZXOC9SlC21vm_YxA
X-Proofpoint-ORIG-GUID: CV1nHLX-vtTiT67KZXOC9SlC21vm_YxA
X-Authority-Analysis: v=2.4 cv=PNkP+eqC c=1 sm=1 tr=0 ts=68b773df cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=ff3wTCdbfDm941fWPPIA:9
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-02_08,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 priorityscore=1501 impostorscore=0 clxscore=1015
 suspectscore=0 adultscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300019
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_154656_419573_437B2454 
X-CRM114-Status: GOOD (  10.97  )
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


On Fri, 01 Aug 2025 16:19:20 +0530, Rameshkumar Sundaram wrote:
> Currently, when updating EMLSR capabilities of a multi-link (ML) station,
> only the EMLSR parameters (e.g., padding delay, transition delay, and
> timeout) are sent to firmware. However, firmware also requires the
> EMLSR support flag to be set in the MLO flags of the peer assoc WMI
> command to properly handle EML operating mode notification frames.
> 
> Set the ATH12K_WMI_FLAG_MLO_EMLSR_SUPPORT flag in the peer assoc WMI
> command when the ML station is EMLSR-capable, so that the firmware can
> respond to EHT EML action frames from associated stations.
> 
> [...]

Applied, thanks!

[1/1] wifi: ath12k: Set EMLSR support flag in MLO flags for EML-capable stations
      commit: 22c55fb9eb92395d999b8404d73e58540d11bdd8

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


