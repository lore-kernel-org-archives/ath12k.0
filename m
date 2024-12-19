Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77A97E7718B
	for <ath12k@archiver.kernel.org>; Thu, 19 Dec 2024 18:07:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XXWpfwq6s9n4hTpXy3T+kYTh7FpeKtWlQozmhDIIrtU=; b=S3F/E8wlliF58ah/XpJzg9rxPy
	WMAXpOlzaPT0dP0gLd33wtXPDV50H3gSFIFDjIsRclVJtsLoHBq3RCekrlYr6tEuo00EJIINxGGC9
	u+hkM0JDPg0F0WuDhdHPeHCuVfnZrH5IJq6HkQ8B9K1Q3CY8hfeeLpYcXKfk/4Q0nqqiV97HRY7IC
	2yqb4cf5romTEnElEcer991adk+C9NSuw/Pwm75dzKHOhJm64A/XAr/dxeMZnuitO/4m3oZbKiTjv
	Y9PZDH+vFThTy5QtzUuXV0EASn2JqKzD5Uu1ZI5G3PeUflZcmZxKjaRil7ApeSuBwi7uN/gdtlI+h
	v51fZPfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOKvj-00000002gsW-13N4
	for ath12k@archiver.kernel.org;
	Thu, 19 Dec 2024 18:07:23 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOKjg-00000002e6y-0TJu
	for ath12k@lists.infradead.org;
	Thu, 19 Dec 2024 17:54:57 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BJF4a8h028892
	for <ath12k@lists.infradead.org>; Thu, 19 Dec 2024 17:54:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XXWpfwq6s9n4hTpXy3T+kYTh7FpeKtWlQozmhDIIrtU=; b=BjjViz/AO4bhp0Wa
	Lwvydi9LeSUAuyb9RTQuGM/8BR7w5f46QCNMtaKko3bS/DeSulrY/lnd8T894Dv1
	qp01TTv9G4DM1aN4NbrrW8FBDZFVM/k9SuXGBi3FeTcMpfR2ZtZppqRyIKLbVRQI
	QTApn5/iJ1YtXIcB/HR4SfHJo1wsuaSRZ9UneqPq4UDy+c4qke0P7+POhvSutZyb
	e3RIfMHeAoZVEoJh/RoUs3bvPbrJtpvgxt4K787dJhi3U1wdvssj+/UNt/XbBhOb
	JbKig7UCxoj4Pdj/Hp6rmVy5Wql0GGRxwcOdUhLUYwcMRSxqzBGmQkiNUq8eo3Q9
	Gdcs3g==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43mntf0fgh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 19 Dec 2024 17:54:54 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-7fd4ea959b4so1056566a12.3
        for <ath12k@lists.infradead.org>; Thu, 19 Dec 2024 09:54:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734630894; x=1735235694;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XXWpfwq6s9n4hTpXy3T+kYTh7FpeKtWlQozmhDIIrtU=;
        b=qf+KCAy6qlUWGQtQfSUEXJD6+sx07j+AyAy/KwkXeKd/YvV/XgeWooLOcqA6xp4Qkq
         KrdV2v4TBCWsWovF254M/I4KDlMUfNGSj9wHyrt0xIBAZCo356QTUEkeW+CwlyYn7W+i
         lveO2m7jYaMZN0ieljUuPO0Kz3XD5c78PyEH9+0vzXiBNo8oqaotu94IUbVWe+7rDZby
         yGnNhdjHcbg+0cKiSwTyIK64Hx16rrPMf3+S4/6q7GMAiJ7S92T24esZXfJM+C7Fr+65
         fKqnugRHPKjc2uXY3dyU9O3Aw0tj1Z3n9PBPYAAw+invSe+ge7X2mkzq0VtbCGG30WKy
         fCnA==
X-Gm-Message-State: AOJu0YzK616gFdtm6Clx86mFS5aMYoccnJq0sJooZ3pWw6VuRXnZkQYg
	DTfafDIzl3MR1DrUH37KABI4GFjDFrzeY6jd/hhu67fext/2peLvxPGkCn7awBVdvzbAYNh0N9n
	hCyEsTQ8Q1rj8FaMwYJjiY4FTm5gWz6pCDTpBqazIOduFr0OKjet80iNJpi5DXukzwChK
X-Gm-Gg: ASbGncsFLkL3lJsKRpShHBd5qDH+UDN//mko4OSKBS1LMgxeEoAB6IZYsRfQhmvHEmw
	zpFkdAYuq2KdtQq7kf6EWY586v/dwZyOJXKIre5VB6oANHZs6Y/Sz8Kvr/JPjP6ADMHTZkKuZ5Z
	PqI6dMi6A5oV5gM/zJNDp3ETkKfVlKVJ/waFeuT1IZ4DM+s9gxwYMeRo1CmZkGFgqZHXA579tuD
	bVrujOBTbOQl11T3LhmjOoW0DCWprXcV3VMFgxJWpd/j8CdpJ5cCrAlm1jtLeSH2vMu7/4laMdd
	Yg/bNXaiaTMEnPRvgQ==
X-Received: by 2002:a17:90b:1a88:b0:2ee:d024:e4fc with SMTP id 98e67ed59e1d1-2f2e936a09emr11516345a91.33.1734630893774;
        Thu, 19 Dec 2024 09:54:53 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHHVEWGrl+yFM6z11suYbeXyHBZiPYWwvLuMCDB/ECAksoqc0Hxz/YQPnTbdLKWqWqTNUNjPQ==
X-Received: by 2002:a17:90b:1a88:b0:2ee:d024:e4fc with SMTP id 98e67ed59e1d1-2f2e936a09emr11516312a91.33.1734630893402;
        Thu, 19 Dec 2024 09:54:53 -0800 (PST)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f2ee26fdfdsm3630628a91.52.2024.12.19.09.54.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Dec 2024 09:54:53 -0800 (PST)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: ath12k@lists.infradead.org, Kalle Valo <kvalo@kernel.org>
Cc: linux-wireless@vger.kernel.org
In-Reply-To: <20241217202618.1329312-1-kvalo@kernel.org>
References: <20241217202618.1329312-1-kvalo@kernel.org>
Subject: Re: [PATCH 0/4] wifi: ath12k: few fixes for clang warnings
Message-Id: <173463089278.2609009.16421252529059119912.b4-ty@oss.qualcomm.com>
Date: Thu, 19 Dec 2024 09:54:52 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.0
X-Proofpoint-GUID: vtihnBycjzYd5sIpkwze1AK6ZckS5f69
X-Proofpoint-ORIG-GUID: vtihnBycjzYd5sIpkwze1AK6ZckS5f69
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 suspectscore=0
 impostorscore=0 adultscore=0 priorityscore=1501 bulkscore=0
 lowpriorityscore=0 clxscore=1015 mlxscore=0 malwarescore=0 mlxlogscore=933
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412190142
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241219_095456_161334_D625D5A6 
X-CRM114-Status: UNSURE (   9.40  )
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


On Tue, 17 Dec 2024 22:26:14 +0200, Kalle Valo wrote:
> From: Kalle Valo <quic_kvalo@quicinc.com>
> 
> While build testing Jeff found some clang warnings, here are his fixes. Please
> review.
> 
> Jeff Johnson (4):
>   wifi: ath12k: Decrease ath12k_mac_op_remain_on_channel() stack usage
>   wifi: ath12k: Decrease ath12k_bss_assoc() stack usage
>   wifi: ath12k: Decrease ath12k_sta_rc_update_wk() stack usage
>   wifi: ath12k: Decrease ath12k_mac_station_assoc() stack usage
> 
> [...]

Applied, thanks!

[1/4] wifi: ath12k: Decrease ath12k_mac_op_remain_on_channel() stack usage
      commit: aa21668ab3c7c479998be11393e1a1c3c2624fce
[2/4] wifi: ath12k: Decrease ath12k_bss_assoc() stack usage
      commit: 445718c9958c8c160654068014c0e72505f59d63
[3/4] wifi: ath12k: Decrease ath12k_sta_rc_update_wk() stack usage
      commit: 6ff412420e5ea1635385038a0bb4c77420862bc9
[4/4] wifi: ath12k: Decrease ath12k_mac_station_assoc() stack usage
      commit: bf2da5c4f5b576d45f5f0cc0f508b8255f7ab015

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


