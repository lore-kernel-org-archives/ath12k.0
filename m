Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4347DC9830E
	for <ath12k@archiver.kernel.org>; Fri, 25 Sep 2026 15:27:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AMXbf1KVzY+/YL5Xd0vxtQ4Rer17TezgpyQ3zdjS3RM=; b=2W5gxFEQxZXSgNv2G5eiLsDNW+
	FE9IGmXvkre1JlwVct5ID1eey+3+JAD4uN2x6FeqOTneZI7thVLaQNO2ig0CKXbepsswM8mbZ+k/3
	V7yjLTntK4MHJrlsS8w5kVphH/aQF4AHfPC0qMH1iQ2M6p/yv/2QvK9HhgzS5N0xdiSPRSrJhYjHT
	mIJ74TZ5qLi9b34Kx8b+6B+t+9TK8d8eAXyAPO+RUN8iXwc5F3zlWDsoOoA9bXud2bf245+8ERbOa
	5ohuoHhYLhLJWGR3yZc4R6lxfuuvICkcNtQwbVU4l24U5jW1HuR33ntXIgtfoZdD2m0E29j6FQMyV
	iZpacnAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA7pG-0000000Dmce-40bJ;
	Fri, 25 Sep 2026 15:27:02 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA7pD-0000000Dmbt-2fgX
	for ath12k@lists.infradead.org;
	Fri, 25 Sep 2026 15:27:00 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68PE7bei3627530
	for <ath12k@lists.infradead.org>; Fri, 25 Sep 2026 15:26:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AMXbf1KVzY+/YL5Xd0vxtQ4Rer17TezgpyQ3zdjS3RM=; b=Sv1yHC5MLBe9tBrN
	v09xBB5HCx5W5BjzoVN+EJbfJlcuCSQq45jnYiBkyYBAkn40vqbmQDG+ZYwxdSXK
	rRyy26d2Avbh3xt7UdjaBDNf1ZwHLwKBLPgqJCaqDtYOS0GKe+93o+ijrgFwtHGL
	9Oj3ZPLvPJoARU5whbQE4AUbcQ1cDPlKNifyAcvkRaQIIht3SwI7Tk7m0OMbRLCJ
	GmKg9i9TU0cBHfgf1qJVIbOthVygNlcCqxbGZ+g8IPDSyVM8yWcaYso7IOB1qdUz
	7n27+P5EW2S+6zg8ZAE8HhUm5HMfeEDtidwsmYTBAPDQ9oIXyVOLYHci5+RCfhGx
	Zo10mg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gwjq39yct-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 25 Sep 2026 15:26:58 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3a0b6ef90fdso1019146a91.3
        for <ath12k@lists.infradead.org>; Fri, 25 Sep 2026 08:26:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790350017; x=1790954817; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AMXbf1KVzY+/YL5Xd0vxtQ4Rer17TezgpyQ3zdjS3RM=;
        b=LoGJJcDX5HOQI/OmajlRx6BB6q6TIvk5C4mzhD7YmxOlzv6VuP30e7yudaJof3w/1p
         8SExa1D5gcQAbTjhZyd+eJN/RSg6rl2PF1VkuQVWpa875jSlHLXJpNZYB7E9Q9TJ+t14
         8OQdao3punOZ23IYLGxn6QZIcCwOyG6mrPN9yiAfIio09GYo5QYWXw7iWSlZaQkGbdbU
         HQ1CSSyunNNeeLWr0FmNzPN7vZJ4sI3a8Wpp6ERCuLnQ7fQXRAgYPaj+IBi2T5ndvpxb
         DqYixNIfj/0RnO/5NRgy6WqnBN+dfgQOU+iBxootGVip4FLTUab8sJPC9RbpKJ+hiDvr
         0LeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790350017; x=1790954817;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AMXbf1KVzY+/YL5Xd0vxtQ4Rer17TezgpyQ3zdjS3RM=;
        b=w798xhiQTdUND68EMl4R3153w0IJ7ZmBW+5vTIOYQDLkCe52Rj0tIQt0wZwaiydLfO
         EqPeLZrOziY5TNRWK+UxfIWXLxADSqguVImE4mkL8gvQxaTWvUSPOLmctjz7znPgabRB
         xrLY5seCDuaRo/CasdkF5+P9YltOfgi4TDElrbe7e34Do5zWHnOAFiTc4euLB8uRx9P/
         mYJ17t56ASVNHTf6QvgekeFcCcVfzwlk3pbgJJqz+ZePhaD0+IbyXXUbMuYsPRWSmuGD
         bCIXBqaYBAA7JImHwS/vdCaWLdkSkP2SdX3lalQD6rcpuPFy1atCH3B850gVMy4PPPGZ
         CKvA==
X-Forwarded-Encrypted: i=1; AKwUvBwoCtdxBI9/6O6ci9EfQR1A76Joew/PRBn0KghG2PNaK9InZ1DfolzbI1EShWvidDHX+b2PKg0=@lists.infradead.org
X-Gm-Message-State: AFuF++m80Jqd4m13PKAjmvSaYHDaeTk2GfAo/YJrP3HlxgV774DF7IqA
	U8ux7d3u61crtzbpmsY0Lxn7PjHq6e1z3oOErP7sJjyed9Gu++zz/qa+KR1v2RQJKsKnamTM7IS
	1nyqEUdupnUxnHiStrDekOuSnN0VNogIJyk8GdU398buZea47Xk7eKeiFy7M8t/Ty
X-Gm-Gg: AYBFou1vABZatQ8wFI2iPhH5hDBYgCzgvK+XK4hvPCOBIuL0KtzuDgDesJ2kmeN7YJy
	yrtet1t65wAeQYD9o4yaEnWx6NgHvXPimwzxnA9uP1yEjwIqQ+x5iKP0ZKsjUo/X13Ve/JqwnhS
	MibhYVOsmPJcXvuJHnYjFQZBTGAZuhl7I+NHMzXnFG77DFPbhTV+OHUYE/mmr76GukIyR7pZqto
	32WbLZfi+DiB8RwhYWJ4s1MrkgBnYdmINTSbvtrImN0IFWM3UBDIx65hy457O5Fu+S41RSE0DVK
	8vCU6RAKsNfU5eiJXhP+mknCDw8VILkrIx77m9RFcDdwUc2kWEOlGTCEutf0PTIs1hgQ/JbQyNV
	7C1PW9eWj950Fi9IYXBOZ9Hxq+Fct1oQ92asS3pf3BWdUKHvYMBiFXVY=
X-Received: by 2002:a17:90b:1c06:b0:39e:135e:130e with SMTP id 98e67ed59e1d1-3a098570ff3mr5247459a91.3.1790350016614;
        Fri, 25 Sep 2026 08:26:56 -0700 (PDT)
X-Received: by 2002:a17:90b:1c06:b0:39e:135e:130e with SMTP id 98e67ed59e1d1-3a098570ff3mr5247444a91.3.1790350016057;
        Fri, 25 Sep 2026 08:26:56 -0700 (PDT)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0b898cabesm5320405a91.0.2026.09.25.08.26.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 08:26:54 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org
In-Reply-To: <20260730-ath12k-align-qmi-memory-v1-0-0fef98dda614@oss.qualcomm.com>
References: <20260730-ath12k-align-qmi-memory-v1-0-0fef98dda614@oss.qualcomm.com>
Subject: Re: [PATCH ath-next 0/3] wifi: ath12k: align QMI memory to 64 KB
 boundary
Message-Id: <179035001448.3875741.8716218454908283754.b4-ty@oss.qualcomm.com>
Date: Fri, 25 Sep 2026 08:26:54 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDA2MSBTYWx0ZWRfX0dERRztWKTo8
 b9vXMZsi77tpalO0sttSnKAPkrJny42FjgPWO2H7p5TilnT01z0ERDuzhFKJFBMLVlyQ/3QiMZW
 Rys6+1DwYAX2Vgvzj3+xoCIwiAuTMHU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDA2MSBTYWx0ZWRfX+Ei6WCg9v4t3
 X3/S5R4U+E89cEIGOkLAzpEFbHBESs4fDo2b+fPPuOlhmYuWgZsiDj8Sl28OhUV9Zu6yjMKX6jA
 Ziay3yaVOM8CdWu8cMnDJa0tcxqqFcUWroV2dQx+l1v2msOWsAOjLCF4xqpfiwRZveMSFvMBaRw
 zEmc8j7MpwEjhx35qPHg+PtGBQV49Byfj8eQB0i0yDf4HxQD6WDTftTLXf1QXM0ziy2U5Ohdnpt
 6x0k1OwLywYvROn4a+eD0+n6bHwxxovCJc/Y8uAtBsFJlXRwyCsnwWT56fkpRRXtl/wh6plkzfc
 IgBtnMNjl5/ZoZrNJgUwz1ZjM56nu7rALHNntUzfDd+JsKSDfqxdLwmyXQ8/PhbAcMquUBMr7v4
 F9dDw/Br8ht62q5ibKHysR1MNJUxTp+wUbHH/DX3ePDEtWeYkuf4FI1wVQK3YchJyYB1UQqRbeC
 Qsnyr3fVP7nUky9WJSA==
X-Authority-Analysis: v=2.4 cv=VuO2kO2n c=1 sm=1 tr=0 ts=6ab692c2 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=kY42MZQJaRLxy9bkkKwA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: 0VVK6f3Y5pdsu3mSJcOjtaFC7LdVT46Q
X-Proofpoint-ORIG-GUID: 0VVK6f3Y5pdsu3mSJcOjtaFC7LdVT46Q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 spamscore=0 malwarescore=0 bulkscore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609250061
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260925_082659_816717_239FE5EF 
X-CRM114-Status: UNSURE (   7.16  )
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


On Thu, 30 Jul 2026 14:17:39 +0800, Baochen Qiang wrote:
> Firmware requests the QMI memory to be 64 KB aligned, or crash
> may happen. Fix it by manually aligning to that boundary.
> 

Applied, thanks!

[1/3] wifi: ath12k: use per-device max QMI chunk size
      commit: 4e286c780d75831a169b0489afd015214838affd
[2/3] wifi: ath12k: clear chunk paddr and size in ath12k_qmi_free_target_mem_chunk()
      commit: a1af8645cf2dcdac5c6b3929e1dcb2274ca9f27e
[3/3] wifi: ath12k: align QMI target memory to 64 KB
      commit: f7f05c443361ebaa503e054e882633913273b3fa

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


