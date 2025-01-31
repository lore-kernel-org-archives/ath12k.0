Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83C6AC0218F
	for <ath12k@archiver.kernel.org>; Fri, 31 Jan 2025 19:34:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/iW/2qxNn2EpMG6+5p2BMofbrneeebFTJmziMbge0Qs=; b=5A5l5SPsgRBS1FV2A1GYWKGPNt
	DhRlzTVzBmujwZuYb6Jb1QD+WXdSxrF6BKDw9AvfhJT+DeVurV5Qrer51txnkKSgfIvYcbuge/KqL
	tDX1aWAsdriGaaLP4XRbrgsUnGumCtjqWroaWM3TzcgQtZLi+Op9WehJWKhyQR3ceTHvtaM1/Uw5c
	11NowzRjnqJkP6Uje8DrwCR1GC51r3FhY3Ww5L0bVdIZ4g2D+VWn3hKGdbUencsd4eH4axvwJDdU/
	K03pJW6RR1G2z2cJfe4Si4wQ3d8Kge4B7WQfXbJUZzoTP7GLfHYqxn6DYEtPvX95Lu63ZWcp39/Oz
	fzYGknqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdwmX-0000000BIYa-0tkH
	for ath12k@archiver.kernel.org;
	Fri, 31 Jan 2025 19:34:25 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdwmS-0000000BIXB-0rH6
	for ath12k@lists.infradead.org;
	Fri, 31 Jan 2025 19:34:22 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50VDL5dS020683
	for <ath12k@lists.infradead.org>; Fri, 31 Jan 2025 19:34:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/iW/2qxNn2EpMG6+5p2BMofbrneeebFTJmziMbge0Qs=; b=DJx4MuvDfeSHhcVJ
	XlMbmaHwr2Qw/EP6eCQcLe63uE6dWWNvhGuzJpGFmLGQF4FbxZ5sfyjcRZY9LqIG
	PwvMPJ4l+5aBbDg2cp/MHzGnfFwGHHtXS50CGOsRMDQNNkTeoY9cf0e3zv8OFrN5
	px7W8m+lTe8gGXgKodYpZdpkWJHtCt2hxPTaLhX2esWxtkVKVZRUhxcS/9kz4x92
	3+JVPlQ4zTssU1iT8+Qow9MixMVleiVQmKrFwkUbFepigLR+O9GwRSkTHZmzq9BH
	ME9mTn/tGnHPv9SePSHsBwZXUlfzDw7UGU4S6BHb0dLK0swbLHptgBXzs8ZBQjny
	hcL2Ew==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44gyapgvf3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 31 Jan 2025 19:34:19 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2163dc0f689so66844835ad.1
        for <ath12k@lists.infradead.org>; Fri, 31 Jan 2025 11:34:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738352058; x=1738956858;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/iW/2qxNn2EpMG6+5p2BMofbrneeebFTJmziMbge0Qs=;
        b=J5Ny8m7GKiXBKLJYN4zV1fFtyI9SG859D4W1TaLzp3EmYffqtDyR4m1wSlSVsyHW1I
         vAxbQPMNytxaLYBILhvDRaNit4K7eHH+59csEAKiV5F6iMOOxI8DZuh009Mq67kt7dGb
         KY5YlHmck7XmztoIG9H14m/El6CWfO3KGbKQiDwkAswXnkUPMllZhAX+A2FeFoUlRqS2
         yQtDe6j1LwBYUEPC7Dm84I5yvJwvDtiXmVkVM/76+Iz3NoU1svBvnA8ENOM1Uv0g6fN3
         gBbLslctNx9clflK+uxMrxXF16jNSqZv7bKrfOmlhKSGsEWvCsuBh1bsLV0ErjzC9YAZ
         9O/g==
X-Gm-Message-State: AOJu0YyGmc787foiw2kJVhiocnMwP7XiG36+64Q6uOKF2VmAjVn4qmtA
	3pIMnExPxh0Ndow2sVITjwtXwWg2nHhCEIKXmkxT9zIfYcJSJcrQMBL+EEjaH6eENWMl7ML2cnA
	mIr+N9a/mcQnykbeHp0obQewOfMDNlEgKUJDqmg9bohOc5ghI77wRCOsJkFmh6V9sTR5c
X-Gm-Gg: ASbGnctWyhzZ598nkCkLY5eMP9cJWOS0fXSb0Y9WxS1mOQ85/S/BhGseMn/wzoffTNw
	ndQE7xPTEjeeiwegoZ2e1u89KXKIjxpypfS0FdBwp1s338zw8EPolRBkdgrfBj443zyVDENg+Wu
	3uM4jte0fCu1LffzfaVqsizTgqtLWq5BUKmKxrcE+ZzCsRb2VxeEWuM/djBa5RzQya9pN/GRbfc
	z3DCKh2NCb+Sqy/vSgqwita34naC3vstZP/R9S89IbhD/gvnIv6CYilIU6ogm5IJL5rjtGtzbZQ
	Lbl6t18g+g1S9uBYtl+TPt993o1jdab2O0BEt9bnpA==
X-Received: by 2002:a17:902:d48a:b0:216:4064:53ad with SMTP id d9443c01a7336-21dd7de20f8mr215305245ad.48.1738352058601;
        Fri, 31 Jan 2025 11:34:18 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGyfULQeSiiDYkhpqhyZgfXGSUVIibS7WsKtnPhn9q9CqH8uXiXQ0B8xheM4FWNRiqBoIAKdA==
X-Received: by 2002:a17:902:d48a:b0:216:4064:53ad with SMTP id d9443c01a7336-21dd7de20f8mr215305015ad.48.1738352058247;
        Fri, 31 Jan 2025 11:34:18 -0800 (PST)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21de3302a50sm33721995ad.188.2025.01.31.11.34.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jan 2025 11:34:17 -0800 (PST)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: ath12k@lists.infradead.org, linux-wireless@vger.kernel.org,
        linux-kernel@vger.kernel.org, Remi Pommarel <repk@triplefau.lt>
Cc: Kalle Valo <kvalo@kernel.org>, Jeff Johnson <jjohnson@kernel.org>
In-Reply-To: <38c2a7c4f7eaf57b9306bb95a9e6c42b7d987e05.1738169458.git.repk@triplefau.lt>
References: <38c2a7c4f7eaf57b9306bb95a9e6c42b7d987e05.1738169458.git.repk@triplefau.lt>
Subject: Re: [PATCH v2] wifi: ath12k: remove return for empty tx bitrate in
 mac_op_sta_statistics
Message-Id: <173835205758.1098484.10102684203904092972.b4-ty@oss.qualcomm.com>
Date: Fri, 31 Jan 2025 11:34:17 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.0
X-Proofpoint-GUID: WmHslUWomPE74yHLHdZE87OHOcoRzj3n
X-Proofpoint-ORIG-GUID: WmHslUWomPE74yHLHdZE87OHOcoRzj3n
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-31_07,2025-01-31_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=677 bulkscore=0
 spamscore=0 mlxscore=0 suspectscore=0 adultscore=0 priorityscore=1501
 phishscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2501310148
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250131_113420_283430_A0FC1618 
X-CRM114-Status: GOOD (  11.36  )
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


On Wed, 29 Jan 2025 17:55:17 +0100, Remi Pommarel wrote:
> Currently in ath12k_mac_op_sta_statistics() there is the following
> logic:
> 
>     if (!arsta->txrate.legacy && !arsta->txrate.nss)
>         return;
> 
> Because ath12k_sta_statistics is used to report many info to iw wlan0 link,
> if it return for empty legacy and nss of arsta->txrate, then the other
> stats after it will not be set.
> 
> [...]

Applied, thanks!

[1/1] wifi: ath12k: remove return for empty tx bitrate in mac_op_sta_statistics
      commit: 8a5ad319f2e6f0462dbcb1bd3a6ba5097f629a5b

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


