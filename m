Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74A21C3ABC9
	for <ath12k@archiver.kernel.org>; Fri, 16 May 2025 19:40:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PVwBLv72/jIjfc8fkVtQIcacM3WtFV5IJFfM/wgdK2s=; b=zPfes3Avl+qwoYxhjTrNpM0XdG
	aU5qPMoGt55USJiX9P86AK89eZB5bBOZxCeKkEIoW2q1nGD2615I/AnzQawwQOyHqIbH/qmqJNDi2
	wcqJUGHQrrzOwb+XZOgp1tJHs/StJi16avMyy9YpC8SRGowuG2UObi5LvTxyTlhk1A+BHSuBYr9Wi
	D7IG417CAa/vpsfPg4iAfW9/frVsMiFPPNjEPJapzzrNsIPRdHvWsCFnJCNfY4IQ50Czkm40QqcNO
	xDaB5+0zOqwSHlD8cuZcpD9ga5F6oh/MG2VdTbXO845Kw/ML7TgdwYePbio17sjFXpSni5N4pO47R
	TwuaXqCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uG0v8-00000004TvB-0y1i;
	Fri, 16 May 2025 19:40:38 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uG0v4-00000004Tpy-2Dvl
	for ath12k@lists.infradead.org;
	Fri, 16 May 2025 19:40:35 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54GCanwt015306
	for <ath12k@lists.infradead.org>; Fri, 16 May 2025 19:40:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PVwBLv72/jIjfc8fkVtQIcacM3WtFV5IJFfM/wgdK2s=; b=cBTvW9P1f4AIi1An
	Xj4ZaySp7ojI5y6XPl3t3hP7TPh+HtgrYSLFkMSSq0AoPJ59jdHUFeiMmtpeZZhR
	Mv8qC62EqGQmnjGXZg0GvUxnC+bNGZE4vWDJl7uANZyf98op33djQAK44pWDJC+1
	2FLkWAcFo4m3uHIhwGQrwEWu40PCwmmaeYDTzo7D+x84kRToLTrm72SSgCWG4XeM
	qs51TZnG2Us5ssk0P4mKoO62dWR4k0+gkVfkR929d1XQ2goh5BWeYaMmD7OfXx28
	gGV0R7ZoGytr+WMbuPCGWOFAKZxniNJ2fiKozaDKhcdc3Qfs2QLXEI2ky+zQagjG
	VyWuqw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46nx9jtfqd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 16 May 2025 19:40:34 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b090c7c2c6aso1568448a12.0
        for <ath12k@lists.infradead.org>; Fri, 16 May 2025 12:40:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747424433; x=1748029233;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PVwBLv72/jIjfc8fkVtQIcacM3WtFV5IJFfM/wgdK2s=;
        b=vveEo5n6rqjMeS51Kgfl5WU0lF+NVqKDUgEfrXbFiVo99p4szLHUiZVDpjLiBoD6In
         o363yFm5zfZ1aORS03atACxpKUOkHBgT0pXyRW85zLUfhOfU92v3XFWcQ3p/zQhGSJfW
         yYzus+x9nD/1fBTsVm5C09MjMIm0Gtyr4tnurHAtVcqXl19YhsGtFbK0m3Pvpu0ve/z9
         LRdsfy3a7uhidhTG9vBRetH9OXvOdytemSK4wYgJ0pX6ZvugrxDd/cRNt5AxEVxvdOwj
         YzSXwJ2c/bBgzJLFnQCTBpR1GDVRYBT8jIWq8EYYbAMBbjYX9jVLNopEDrXIVHRAz9vR
         sTng==
X-Gm-Message-State: AOJu0YzKDJjTn2kGFLhNvyH4zBWrrXRDOJBNIYhgF5+1nRWUyAgpynFl
	A4fXK0m8/9Lz1ZJKhomvFRjXLk87hdQuN5tkn4ylgyaM6Xln0MvpbcnTaYyOMauzSN34u1BMU+E
	kHgASCzkUAv0lPiF5P00B0uH1DbQsK31K8KHfD++dIIpn3zXMFMawKPrn52DKu73b
X-Gm-Gg: ASbGnctwkM/ab6H/B9ZN6w8dYfy/i5RcuBlRQwAOs9bBBOIuoTHHh633202HqBWGwTP
	DQnOoE3vodjIcLeC1dvTU5adNrcTjnPkk5WzyvxRf5bkyFrXyM/9o5V0SSJxshuZ5HIzIGL/Of2
	WJERz9nJ3vyVCxm/jKBKtJKAZLvc2g070SqHIlQPqFaN/Z10T7H9JknVLiBwM0PZy2GA+0TcsxV
	IB9ncMkM/+2//LVSTCRBFvnPuNLs9zwDFzpRi1LieTCwFLquUEX92ishTFwVdz8qwdCXbu6ktZB
	2DKY7n00SDi7w9VpIzOykktSC09CmgX+Hrio+4d+32iP/YdH
X-Received: by 2002:a17:902:cf42:b0:224:18bb:44c2 with SMTP id d9443c01a7336-231de2e6c8cmr42140775ad.6.1747424433306;
        Fri, 16 May 2025 12:40:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHkIeQF6Ytx/Fz3MUlJS9qx7AyuEa7pBWc8iwkgcsaVL2E2VmrhUxxUSJ2yA3UZ6/9suSvfyQ==
X-Received: by 2002:a17:902:cf42:b0:224:18bb:44c2 with SMTP id d9443c01a7336-231de2e6c8cmr42140595ad.6.1747424432942;
        Fri, 16 May 2025 12:40:32 -0700 (PDT)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4e97798sm17955255ad.147.2025.05.16.12.40.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 May 2025 12:40:32 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: ath12k@lists.infradead.org, Muna Sinada <muna.sinada@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org
In-Reply-To: <20250424221404.1262597-1-muna.sinada@oss.qualcomm.com>
References: <20250424221404.1262597-1-muna.sinada@oss.qualcomm.com>
Subject: Re: [PATCH ath-next v2] wifi: ath12k: Prevent multicast
 duplication for dynamic VLAN
Message-Id: <174742443237.3316767.12135704112973393808.b4-ty@oss.qualcomm.com>
Date: Fri, 16 May 2025 12:40:32 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.0
X-Proofpoint-ORIG-GUID: oQsj9EDOvb6ULJCG7ov_MBGPUDQKaenR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE2MDE5MyBTYWx0ZWRfX/qcr8NKlZKT4
 hlBdUjgSXst+XEN4ih+3CYcP1QrvUewT3R7wuPMUYkT2ARcPSjg1nzd7taAO9BxgHXKwCXTp/cm
 bgGjuj2+WXLYWCBHtuRgDThIWzAZPQBCMTAm1L4azghmfbN2UinjJ7iUDJNSwYk9t6Q60+o95z7
 9apCWnrQyS6M78XQwl5kYiKSRYinBKgDyQeQkWzvYVmSbN86KPHvjWDtwPLSAjh6MaNRCSOjV4a
 z1pNcdsE0APn8qOtl9ABps5qHidExUZArlVzljfcO3IBGJMvtv5UGzMxKoWcHC6J6obewWzQSvr
 tLT9gcgujBHvCxbQFwjWGbe9xauWpAVRyRic4tjfzjh3rCHaSRGZBfpX/5kzCuzBx5PzmFVrIcR
 OD1qozyn8VCKxyh9C7obDrkARIgBpMowdzdxMXbNv3XCQ/tBQjcsH2/muM7rAJNteQjzl82r
X-Authority-Analysis: v=2.4 cv=CIIqXQrD c=1 sm=1 tr=0 ts=682794b2 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=MUrHrFjxuhniufZK1DcA:9
 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: oQsj9EDOvb6ULJCG7ov_MBGPUDQKaenR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-16_06,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 mlxscore=0 suspectscore=0 lowpriorityscore=0
 phishscore=0 mlxlogscore=671 spamscore=0 impostorscore=0 clxscore=1015
 priorityscore=1501 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505160193
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250516_124034_585347_0D6E2FA9 
X-CRM114-Status: UNSURE (   8.94  )
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


On Thu, 24 Apr 2025 15:14:04 -0700, Muna Sinada wrote:
> Since dynamic VLAN traffic is software encrypted and encapsulated,
> mac80211 handles the duplication on each link for MLO dynamic VLAN
> multicast.
> 
> Currently in ath12k_mac_op_tx(), all multicast frames are duplicated
> and are assigned a mcbc_gsn. This is causing dynamic VLAN multicast
> traffic to be dropped in hardware.
> 
> [...]

Applied, thanks!

[1/1] wifi: ath12k: Prevent multicast duplication for dynamic VLAN
      commit: a5f95d3d02d92421edceb597f93c7348e54a5264

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


