Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DF35C3ABC9
	for <ath12k@archiver.kernel.org>; Fri, 16 May 2025 21:44:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZvexSBQf9AqvTEL0MQV2xVh+Hjlmn9UIZPmY5emHet0=; b=1F64GzlJ7psNKrU9i+/9KWacAK
	xgjUexkgeHlQVCvQCdTbnjvaQCzaglnxPekMNQ4T94iNqLvArI//puqEHQ3kmlyZc49lN7NvQJDWP
	dJdcglXfgv7/ZGV/4VAYTz0orcyDp340Gbli+xS4ppeEWNdwrOcJVo6SKoLuBmz3bUnDWv7D+QIAf
	q0/ZFXW8IH5VqrQ/JhAqLwG7IQBiGK0omOyoSW6OdlX1gsMmjaejA/n1LcB3QdFn+SJ7PVB47Pv8s
	+8eZnnJMp1M7JCakM5cbd2XvUTScXxz2LPTuSn2zgvfJ3SIe63tSfudoW9QH4zRD7AGbEf2dMAiYd
	zmlOPwOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uG2qq-00000004gQ4-09zd;
	Fri, 16 May 2025 21:44:20 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uG2jm-00000004fBs-0XRx
	for ath12k@lists.infradead.org;
	Fri, 16 May 2025 21:37:03 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54GJOCSP022658
	for <ath12k@lists.infradead.org>; Fri, 16 May 2025 21:37:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZvexSBQf9AqvTEL0MQV2xVh+Hjlmn9UIZPmY5emHet0=; b=llwuOhifEInXFWey
	kuJmN4LfIjKr9jymAX1ilEN2hSQS2keCYjIK+Iqpfs/ZTa36M1ehmzWagZ6gHlHN
	4a8D3J1jVJk1veZQxLw7gBzSWmcaIVd/7eIxenS5qSugRjL/n4Swr/rjCl1hn6SF
	2CO/DEzcgo27vAs0wpdjIoCBSWEm9ndPJ6GmFXmagOo6sz3aWZgVzGq8RRczNvHC
	R5qpYWZK1bjIKJe8r8R87T82LkpoqEfxsBIRhSQSSP6GHqepfr538+JCDN3ViIzm
	bOCxpdgZSlRbryu6IKmR2ZSUAT0C0ygsc7mI2pNwq+474GZlrM26HE32gR3b3PUj
	aROMiQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcyue9q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 16 May 2025 21:37:00 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-30e9659a391so486092a91.0
        for <ath12k@lists.infradead.org>; Fri, 16 May 2025 14:37:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747431419; x=1748036219;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZvexSBQf9AqvTEL0MQV2xVh+Hjlmn9UIZPmY5emHet0=;
        b=lc/ZUdF8sGKXSYdcPPyMzcYGs8aMKjDnIlj0Ud1EzbgbhOLgUlruf6Oc6rFMW96XeN
         ctgzpGaGkcKOFojBKHX6+Mxd/cm+qwv+tBCji4BDM/9xHctmCWVHVb6dKRRM6NErRoD9
         21Lca4N5SAxb2cH/4g6OqEHAh7oYZbCq6ZLXVnkNy678inuFSUOGi94un0w2KixK5hY1
         XUVtT+HaGag+vqqa6PrMQaIWhk5HRiYfAP3GmUaWxEzhzRwYeAzQj2whsjDpCTlR4RYD
         mX1pIkqXVoHBYFlMrC4Ncsp/zshqKzd9HgaBSG2mmr9z2ovcjgHS39/+ypNGQPkgu4sS
         J2zA==
X-Forwarded-Encrypted: i=1; AJvYcCWaPmriu299BWCiX+AqbJXYpCEDjfjvdMHQpwABP97n6WJnoOTu2kevgsUChw3QDgLCxXvmmcc=@lists.infradead.org
X-Gm-Message-State: AOJu0YwydQgH37V/rOvbMniBcKRT5HuK9Xt/CRrPQwbFQyM+KAr0IApY
	tuAJKDjmDtGLG8EaStUiYXktgOElbaZMtFswLaFZ2OeYahHUwuKh/7e+xPOJaflDkmgdH24CZdT
	5b/oogJTTe7BShBeDdao9SP3lvt/sSBe+YJWhTdko5c+Sltuy2Ouga+WXaBfHVrq2qYlyTIpU
X-Gm-Gg: ASbGncs7mSihEIC4vNyGHVsAGAasCsedIzaIBSUDv/krb2ak/BKu5FOwrnPb7JddKSV
	WCYZvVskQ5yGMCJgFKQ4YBIvEDsSqTJMa21zD8qEYVgU4xBXDNZ2e4+7xruFhBDehxtZzzVaO95
	dECTJYhPZyjNHNJuuU/UB0oeN2hyYCWwn0nifFB+3ajklJNcfkpnpr8ST6CfDzyuC81zXgE4DEg
	2LBlYOlEmbNiwqGmR0TF74Ao7Waq/5DTfVZmDyXHomhSVnQia+CkZLgGH5Q9YDrBO7b3r5mC7dm
	LLqd/pliSvcGOurdRmsRmP8zDPEtI4qszLMlLyDoih2LZSdp
X-Received: by 2002:a17:90b:3b8f:b0:2ee:f677:aa14 with SMTP id 98e67ed59e1d1-30e830ebf2cmr6020186a91.13.1747431419365;
        Fri, 16 May 2025 14:36:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE4iAEj2lGvHPTdxtDA1MTNbRsd2iYilUgI8JO1IutY2WKZ40LXK71qBKF63X0diDwgdPQNFQ==
X-Received: by 2002:a17:90b:3b8f:b0:2ee:f677:aa14 with SMTP id 98e67ed59e1d1-30e830ebf2cmr6020160a91.13.1747431418987;
        Fri, 16 May 2025 14:36:58 -0700 (PDT)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30e33435b25sm5658010a91.17.2025.05.16.14.36.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 May 2025 14:36:58 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        ath11k@lists.infradead.org, Aloka Dixit <aloka.dixit@oss.qualcomm.com>
In-Reply-To: <20250408184501.3715887-1-aloka.dixit@oss.qualcomm.com>
References: <20250408184501.3715887-1-aloka.dixit@oss.qualcomm.com>
Subject: Re: (subset) [PATCH wireless-next v5 0/3] wifi: MBSSID support in
 MLO
Message-Id: <174743141835.3870542.2654124463344102892.b4-ty@oss.qualcomm.com>
Date: Fri, 16 May 2025 14:36:58 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.0
X-Proofpoint-GUID: qZoLFmm8KfNZci6cr8z7ih8Okfc4T-ad
X-Proofpoint-ORIG-GUID: qZoLFmm8KfNZci6cr8z7ih8Okfc4T-ad
X-Authority-Analysis: v=2.4 cv=JszxrN4C c=1 sm=1 tr=0 ts=6827affc cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=aA1yfRMYb10aeN-VgkwA:9
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE2MDIxMiBTYWx0ZWRfXyBzCemnrQSZ7
 OvbCg+66+uCcsTmzeWn4GdeK2/AEM6djc4QQ3q+qL8r49ndZhnn5t1hf0iJvPCJYZMTx7kOnaBG
 teLgRyWs71juQTa0QaupGpv+Dp1e8R3VdxLTH6gbFIeRoX4/2N12FP/1yyHiTM5JqE3lvu8hjMT
 EoeoyXOki5wYD2ZLqC3dZp2BftaIXygcmxcK4pI9L3L0cDLOTmBuGTwmvOUD7NPCx5B532kMKV8
 KZboiHwEUFhZ8rJfCgURH3PrAjZ28tOkLdN2Zsqtsn59ToLtv71lfolWMkJvkJ08j8OJIkpnV6g
 05RGvA/u3r0VA+D2EWKpIY8kJHBRUydhQ29I24QOCWUFuHbbTpKOhNVueeAojLf5HQdt6xSJx9t
 MN9FZlENhXjtVv8vaUi9Uwix5vKOx8iIa1uODyDfOKynKBlK+qh0iNnPDghalE+CbwAOU1N7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-16_07,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 suspectscore=0 mlxlogscore=975 bulkscore=0
 malwarescore=0 mlxscore=0 adultscore=0 phishscore=0 spamscore=0
 lowpriorityscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505160212
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250516_143702_188642_7160EF0B 
X-CRM114-Status: UNSURE (   9.33  )
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


On Tue, 08 Apr 2025 11:44:58 -0700, Aloka Dixit wrote:
> During non-transmitted (nontx) profile configuration, interface
> index of the transmitted (tx) profile is used to retrieve the
> wireless device (wdev) associated with it. With MLO, this 'wdev'
> may be part of an MLD with more than one link, hence only
> interface index is not sufficient anymore to retrieve the correct
> tx profile. Add a new attribute to configure link id of tx profile.
> 
> [...]

Applied, thanks!

[3/3] wifi: ath12k: pass link_conf for tx_arvif retrieval
      commit: 172e1570e1d31260f11f43e828d98aff020726a8

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


