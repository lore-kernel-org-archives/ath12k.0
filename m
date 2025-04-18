Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F770C369C9
	for <ath12k@archiver.kernel.org>; Fri, 18 Apr 2025 18:49:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wuB+po96jyJcpn4GfMishhM3sK+dPLxABDKFmHpEfHo=; b=d08UhMFeFth8+ojh3eUd3BfLpP
	I8LIh/FMtNZu2+FhtvS2sAL4eCQK5xmrV74fzzCbF2e0emPVzK3lheUej1hJkvy9KjVeCfpP7ivIn
	0IkfBZlRdfBxkcBJ75v3rCUymvmXciPwLegNucAHGuJu6AvYMKHUePDxdIHWD8VeZsJ93Ac4rOoS4
	AAWUelLkVXpbT+67NzGkd6Ua3XQODovH2jybzFucXIMLHxr3+/bf7OFx6IMIm2Qa0QWvFijiccHWe
	bFCyt7T0fA+6m+Z/RqybAQLJDt10w9S08wzhx/vzX4/txWQPHRWflu8AbGs9/LZIPmIOyi1lgcDwT
	iVvikIVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5qln-0000000HVgr-3D5C;
	Fri, 18 Apr 2025 18:48:59 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5qlk-0000000HVen-3bCJ
	for ath12k@lists.infradead.org;
	Fri, 18 Apr 2025 18:48:58 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53IEgjMN032057
	for <ath12k@lists.infradead.org>; Fri, 18 Apr 2025 18:48:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wuB+po96jyJcpn4GfMishhM3sK+dPLxABDKFmHpEfHo=; b=a1tFClEj8naI7yJB
	eXQKb0MGBhe82uZbz2bregE5Z83n9L2u98ER+ONW+9n0w1p3OIUHp8w9PgqXm54/
	kkn4U9oOcI5aS56b5Ax3bCuQFjBcnL3JCyvYWqGKFfM1ImXZu3khDY856BuZDWfL
	Kf5lyEOMPd/8BExzDswmok9CwMhVT7yNF/2IT2vnicH/KzCP+67FOmQ4uHoKOTd7
	No+01e4SG2Ct70elTLGKpV2rBJMURxGnbYga7r6OE9TxDBaJj9DQDiNjguY6TrLG
	3xr2EJ0Ad+HAv4Jk3pAtC6oQtKBBQssyorEgtiHgTOsbiaHMoVOK1n+j/sKUwqIe
	C0/YMQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45yg8wtt02-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 18 Apr 2025 18:48:55 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-227e2faab6dso19351735ad.1
        for <ath12k@lists.infradead.org>; Fri, 18 Apr 2025 11:48:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745002134; x=1745606934;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wuB+po96jyJcpn4GfMishhM3sK+dPLxABDKFmHpEfHo=;
        b=SqH9DJ8R2ohsHijRYKfTeAWx15eDHCOH+cxx1if6ra3ohnVwlJRBAsT8gYpViMiOUi
         Dr15v+rejKTB6q7itYHC0padEBAsljgNivZk6H9oyYvClb04CGhnQqNFyWENQ51ink+/
         0XGTdDqeBqCwL6nAEa0JobjJpRlALDfd161el4aoAYo3niEdSDxZlbU9AOqEAdLV6mS+
         h/fU1w3DQdQnm+xMHhCXEkAuW7ZqesxWT/PvHYpX0jvBGzt6xRTnBUj1Kghof8xI8mh4
         p0jBeCT99uOlqb+GHvI+0CqeOXeJbk8RBkNjFyYwZ7w/Z42r9eMrZIjaKlr3Bi+OXwHl
         qVkQ==
X-Forwarded-Encrypted: i=1; AJvYcCXMKsncfDNzYAx1717roSNzECMeEc8M2TQKHJAJKrnxrRNJAfFMnXsHL2FEXDE7H1WhHruNAHQ=@lists.infradead.org
X-Gm-Message-State: AOJu0YxJWcegupjjAt56O65wfPpsCP/KIp9XcZaF6uRrAQDxOaWgb5Yy
	LuPRrmcZD0pEUhbpa74p+DhNrFiAUDeKXAdNmHyCZ5V5cR9lXPnoqq1oKz7qAvwiW1eL1ETQpwQ
	3602oH11iG/VNzOMFL03Nu6P0FGaxElTU3hzntbJ++kvshf1e8DSO4H7Ocluo7cjAhd2a
X-Gm-Gg: ASbGncvYiqBAebN0DLbcfigZvnL4Bs/5nPJIftngCnKSb46p+MKKJzD8fMubri3458R
	IqxJN4joPuDYGfe3whh9pwueMoZF6TuD1JWMK7J5LSHYEXuuxXtGjJ4GW8DUsMFJez+J1lDugXe
	Yd1kDzQ2ww3ZeNSuEk2wjU7wqn1FAVyb8aT/tB6YiEztuEO7wLOe4sV1xLR5h8V9Zt9hWCdt6YQ
	uaHcowiiK8nOnPF8bhHIkfOQYZW7n43z8TuGRBEWtXLEeJkHeQWBpEZ44XfYhTlGVgNiINUKyql
	tLe3TcdF1KaIPgrT2mMfB7DWe5bXJeTpgRapbOBHw+HN9hBxrlPr1bCQ0dWlaORzNWpWaQz3tST
	BbCXD
X-Received: by 2002:a17:903:19f0:b0:21f:68ae:56e3 with SMTP id d9443c01a7336-22c5360dc9bmr53927125ad.39.1745002134176;
        Fri, 18 Apr 2025 11:48:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH2vHOzst/8vCa4KMObopvWwTseNUfwEWkYiCQV5cjRLm5sx7Pyoz0/LrvQgWu55WOmepl4JA==
X-Received: by 2002:a17:903:19f0:b0:21f:68ae:56e3 with SMTP id d9443c01a7336-22c5360dc9bmr53926985ad.39.1745002133789;
        Fri, 18 Apr 2025 11:48:53 -0700 (PDT)
Received: from [192.168.1.111] (c-73-202-227-126.hsd1.ca.comcast.net. [73.202.227.126])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c50eb4affsm20035125ad.119.2025.04.18.11.48.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Apr 2025 11:48:53 -0700 (PDT)
Message-ID: <1173e72a-efb6-40de-87ef-41ebee98aea9@oss.qualcomm.com>
Date: Fri, 18 Apr 2025 11:48:52 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V13 0/9] wifi: ath12k: add MU-MIMO and 160 MHz bandwidth
 support
To: Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>,
        ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20250418174818.3336510-1-quic_pradeepc@quicinc.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20250418174818.3336510-1-quic_pradeepc@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=E9TNpbdl c=1 sm=1 tr=0 ts=68029e97 cx=c_pps a=IZJwPbhc+fLeJZngyXXI0A==:117 a=e70TP3dOR9hTogukJ0528Q==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=dZ8E1E-v023Ymm4DEa0A:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: pCSG5L9w7JoCCIpPruYLbLJfFMAGWXji
X-Proofpoint-GUID: pCSG5L9w7JoCCIpPruYLbLJfFMAGWXji
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-18_07,2025-04-17_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 adultscore=0
 mlxscore=0 bulkscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 suspectscore=0 mlxlogscore=778 spamscore=0 priorityscore=1501
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504180142
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250418_114857_030855_0560F5F0 
X-CRM114-Status: UNSURE (   5.60  )
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

Reminder: you should be adding a destination branch tag to the subject prefix,
i.e. [PATCH ath-next v13 0/9]

Don't resend for this, but keep this in mind for future patches.

/jeff

