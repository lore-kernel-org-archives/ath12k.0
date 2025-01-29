Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BA95C02193
	for <ath12k@archiver.kernel.org>; Wed, 29 Jan 2025 17:04:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cCYxhKn4B4q2UzXNaKibV8fc0rPbgSiq2cv6hbxdtdo=; b=qX2WeZrQRtV3N8eN/T67utdw1n
	3NL/Rq1VmM53s92TBmVdA5aC3w7BhWjiWRsT1TEtVwQN4jeJeXQ1U3docs6rfdPd5pYDg5czleqPZ
	OaTp2nKe3cgSCwWF9GEYEh1HaOzDHqfaGU085dTvzKMfsBbKGVSnbyeA5EkPCzrVwbePmCG7vM4L8
	fe7Zcv7gATBASYMVUuugnl7uGbzMBMt/itGI2mzq/6hjCv85BVVTBbF39uKhd5uNJGYKrePmuLmYR
	aSvVnmYw/2bp6wYAxp/Rw3lcjSLzzxyL9QDOa68E8x1nklIj83/QsEobom4tGM/GUk3bHt9c8q+r2
	3d3u6mSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdBTs-00000007S17-1KMQ
	for ath12k@archiver.kernel.org;
	Wed, 29 Jan 2025 17:04:00 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdBTp-00000007S0N-2wq8
	for ath12k@lists.infradead.org;
	Wed, 29 Jan 2025 17:03:58 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50TAVWru020067
	for <ath12k@lists.infradead.org>; Wed, 29 Jan 2025 17:03:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cCYxhKn4B4q2UzXNaKibV8fc0rPbgSiq2cv6hbxdtdo=; b=QRtBsHptoKTvmVGi
	uVsXVo6pAu3mxOeC8ThgGvf4mIUNB3DXAkS6l8P/ELivSHxldVEUVOPyEPLhwIz0
	FXxIUYKEy9ZzXl47mZra+RtKspygzEGa7HwbQikLjNyrkQUH36Ei5+MZopuxouAg
	7qqilGHWziLoUSgMryr6h7P35nYgjH+eRtpba88gI+0MI52CIyk31tO/5kzJqpj0
	CVUuCZtoD1R2vR7RmiDfjFaqYpyb5ULcWoz7KartSFLTdasqEHg0kbpe4cixTfjK
	Tflyma79gcR0UBQURhZgKSpc58/OZt/OohgO2NHvL2sKfTLuOTRPk6OZQNC0UlOh
	/mVx6Q==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44ff33s624-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 29 Jan 2025 17:03:56 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-2ef9e38b0cfso13638818a91.0
        for <ath12k@lists.infradead.org>; Wed, 29 Jan 2025 09:03:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738170236; x=1738775036;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cCYxhKn4B4q2UzXNaKibV8fc0rPbgSiq2cv6hbxdtdo=;
        b=SSbcbwXSFAJupA8DXgEV9/oOF3ObBIV13ZLGHtkzAgl9LN6+JmGh13Dgt1B7AgMBaD
         wSKOBOpufLTv6mmB7Jz6zVMZXqgF2rHwWXg+U0jVWyXzMDf+6nd21XPmcsR4hPTHFVBI
         q4jqsPBTlfppoWdXXBkJBo/UDTYBui5olRCOCfR3T2IEkv5RBuEJow1+k4l5jdM4qL6T
         IjAh/JK/nsJJ/VYUdWp/aetBXx4n/uoJLhxYbS81qASJIMuyp3jugB4KhSF+VxfPIQIO
         xBzP24FKrizTSi1yhlTLSYxkaBwg8Q/DNKDhRdyfFHTAwO2vK9atl+e6d2EDISLpgDLT
         lYww==
X-Gm-Message-State: AOJu0YxwF2EYBLkWvMyKqBd74/L1mK7PWlplawizX0n5Mg3uu1faWKks
	hoN6jdKyUjiMI1dh7x6rlzpa5qvwrfKf15slg+EK4GTHbaPvJVIlNvKrxWA5+bAW70fTD1XWM4d
	+SOGOkSckRazD3Dhc8NY51ewDy06TP4NCjg6QkB4U+Yw2ZyKBfqGAAEauJaXf
X-Gm-Gg: ASbGncswmwC9IitjmLXpSJWJdESnC6dp682aY9TOj2UNddnrYfnOeGFIsCvlHyDn0FL
	DEMa4THxYuD5vhVwspu/w+UdNK5kDqw4mqw4GmuSkrAPMVCJJyoVcnsc7MgwFQMW2ooBAnF9I4N
	yE1Cb+fU1YDGGbdjLG9rDZqQ41mm4LFKXbBQEVUFbNQkShi0g3FKQOA0HT27Pu3ekLpSNcJ7kOb
	T7zRUAm8jVRrSBMWgpkMYZ7fbVOpOBHOZjq2gpoQxCEzvwCAdwJvsffeiF85ktqJFKrDnm97CYr
	hhXJ+D94Ui6ieWzJhkjQAl6b0X0MM1UFQeyAMKJAfA==
X-Received: by 2002:a17:90b:2585:b0:2ee:accf:9685 with SMTP id 98e67ed59e1d1-2f83abac617mr5297414a91.4.1738170235864;
        Wed, 29 Jan 2025 09:03:55 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFrCpglI/oFl5t78dPoQSEwQUu3I5D99R137n8Ay4Pl8j1UVbu6nUQdGuNOrFSDImafbQPXMg==
X-Received: by 2002:a17:90b:2585:b0:2ee:accf:9685 with SMTP id 98e67ed59e1d1-2f83abac617mr5297381a91.4.1738170235484;
        Wed, 29 Jan 2025 09:03:55 -0800 (PST)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f83be3622bsm1988366a91.46.2025.01.29.09.03.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jan 2025 09:03:55 -0800 (PST)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: ath12k@lists.infradead.org, Aaradhana Sahu <quic_aarasahu@quicinc.com>
Cc: linux-wireless@vger.kernel.org
In-Reply-To: <20250116032835.118397-1-quic_aarasahu@quicinc.com>
References: <20250116032835.118397-1-quic_aarasahu@quicinc.com>
Subject: Re: [PATCH] wifi: ath12k: Fetch regdb.bin file from board-2.bin
Message-Id: <173817023483.726123.2294052678769953649.b4-ty@oss.qualcomm.com>
Date: Wed, 29 Jan 2025 09:03:54 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.0
X-Proofpoint-ORIG-GUID: EIW-wQ_SbZxemNRx1YbNIjhqZ5fweeOb
X-Proofpoint-GUID: EIW-wQ_SbZxemNRx1YbNIjhqZ5fweeOb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-29_03,2025-01-29_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 bulkscore=0
 phishscore=0 impostorscore=0 spamscore=0 mlxscore=0 lowpriorityscore=0
 clxscore=1015 adultscore=0 priorityscore=1501 mlxlogscore=819
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501290136
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250129_090357_755276_AFF10445 
X-CRM114-Status: UNSURE (   9.61  )
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


On Thu, 16 Jan 2025 08:58:35 +0530, Aaradhana Sahu wrote:
> Currently, ath12k_core_fetch_regdb() finds regdb.bin file through
> board id's but in board-2.bin file regdb.bin file is present with
> default board id because of which regdb.bin is not fetched.
> 
> Add support to fetch regdb.bin file from board-2.bin through
> default board id.
> 
> [...]

Applied, thanks!

[1/1] wifi: ath12k: Fetch regdb.bin file from board-2.bin
      commit: 24f587572acf7509127dbdfcbf1b681ef84eeba0

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


