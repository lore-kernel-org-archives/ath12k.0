Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C398606A325
	for <ath12k@archiver.kernel.org>; Wed, 18 Nov 2026 17:01:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=jPyadFi2;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=dNKNkHPS;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=a35iUrV9;
	dkim=neutral header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=G7bMiOcZ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=TnAcE/3H9YIxn0mwaIocneqkjXcRLBMCPDVg/K9mdkw=; b=jPyadFi2SdykA4
	i52XVuNGCy/pCtbAuJp6wWQT4NK3H9MBrS1ds+iC89uF94u/aFj1uZw85Ri+R8g0N427KCYxP3S5e
	I8hm/mBcYPAhR+FaJicxX7MVRvdTspL6RyHMY9NfgNG/xKaPwVcxNqSGqRWwPuEmivpf3WZALHqNv
	OCFr2WqR7ccvAm4dsUcG72TUpgiwTWISgk7cEwRHyL+DaJI0/1YOurEN1M16/GCG2ndL2QuF0ybA9
	tgnPe9kCu47FDHKvHIzt5kQRVCxZnBmcpDOXV6QVaiM376vYoZIZLq+Hn5EjhNgzvDFA01nEDk3eP
	vKjn34U+sgI3HkXoVQ5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTj1y-00000009f9B-3nFO;
	Wed, 18 Nov 2026 17:01:10 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTj1r-00000009f0d-01Of
	for ath12k@bombadil.infradead.org;
	Wed, 18 Nov 2026 17:01:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:To:From:Sender:
	Reply-To:Cc:Content-ID:Content-Description;
	bh=TnAcE/3H9YIxn0mwaIocneqkjXcRLBMCPDVg/K9mdkw=; b=dNKNkHPSCNNubXtszqiEbd/mIf
	c4UocJ/vATzQzhdxMEhWLjyLjvCnMcovsLHkEoCRHt/8mC472CKI71F0/SRsJqI0lteAs3PZkizEQ
	ZpX+m3rcsjA6sNQ/+7vF1m8RpMxB90HuA+P/+hENnmDmahV++K9+VPHD2zHekWeJeYkAaFXdLUEV/
	zN5bx5P5jHlAhOpUuuRmkQ1vnNmSGkHJNreV03SErkCH1EgCL09dXDHUAtLfc+jBxcepTqbMsQiR9
	jt1RUkMX2+4TbgW/4w06Q6Ms//jPvBoHzaT1m8BzemyVj1y2Q24qM5ZTTmOJ6pd0qbgVDZOTQkFSd
	PrAfTZsw==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTj1n-0000000GJKs-0huk
	for ath12k@lists.infradead.org;
	Wed, 18 Nov 2026 17:01:01 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AIGwbPm3373364
	for <ath12k@lists.infradead.org>; Wed, 18 Nov 2026 17:00:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TnAcE/3H9YIxn0mwaIocneqkjXcRLBMCPDVg/K9mdkw=; b=a35iUrV9H2JV/v6G
	BkTbsimTtqDfreGNYapalawMmlC1WIjcdUl8gOcdY+PQ2wRDCgf+arhnERMtUhyr
	p2FVr9JGi3kmz7PIX0USHQOorUUJj47Rj6MUkPunfw1ppOz+6OJ6Q5q0vexDvWxS
	IJMnkoCThqejdABtM7CeSNj9JDIPqu6kU3nvs3rfovcC5U0R3Bw/jg2i2+i5JKK2
	St4UcoQknrFfzk9hm76jM5umFYzRV6YpeIu+KIDcWHu2u24zrgJxINBmnPw+eVTQ
	zpoz05p0qfnu67dZZ9JlFezPNxBwbJRmuA2m02qu5Zpt/ztFqpX3d7zrn+1Aduou
	O0o8JQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1etnrcmd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 18 Nov 2026 17:00:57 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-383435e46f9so492605eec.0
        for <ath12k@lists.infradead.org>; Wed, 18 Nov 2026 09:00:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795021256; x=1795626056; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TnAcE/3H9YIxn0mwaIocneqkjXcRLBMCPDVg/K9mdkw=;
        b=G7bMiOcZ3lDtYCjEYpELfh4EerVD6UVhywtekqigDzAutJ36tp9/DyAzyZxKuqH8iy
         jk+XsjJfRFJJmAPI/83FfzdR4PsHqjY4sz6U3BRVVpnXAXAvD65FdLaDML3mMqfh5p/l
         FRxMt70P7BmCAh1XpgD/jzVPPTOhLQux1pSrCIXs9c4I4OCEEH8O4lB8AUqx1UrHmW46
         GGB3yxNLJUfPCU4kATqWxSWMKNAtvKNoOCw/d9aU5AbKTUhrNG3LmutUqt0SmVRun3EG
         vDbk06YuMNK7kK4oept//BwnI1T+ZwqOjGnir6cbfDnQEzNNzdkT6wien7DzgANF0Ibz
         r6tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795021256; x=1795626056;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:to:from:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=TnAcE/3H9YIxn0mwaIocneqkjXcRLBMCPDVg/K9mdkw=;
        b=s5KJoaX/56hRdvjSsyjIyQ4dbQ1gjQ0yLzmHRZu/3ZoYg6GO6SNA91R04AOuV7IMHo
         AAT3DTxSM8e/HAJiy92v7xkoN1/N0+w2R6hQgVIbfdwN7Pelp297Q8/Ht4Ze4tiYr//4
         eDi1rGKNzamuXnb5vbxBbb+nZWgv2DHCcsjfp7A4nONycU63Q2UBRyCDr33/A4crlb4Q
         FU+eACl/y7Sb3LoXmRm/nzTbPCuY1xAZUJjwBNRrziwXaukxXUgsIMEI+B8H7mGE9niA
         Hh/P/CX4ADyMmg3sR/XJy6ODdGrzeYCsl4FJ6ZkQvcRnlW9GuDYM568BOZkCDgp9GQ3I
         1MWw==
X-Gm-Message-State: APuU4Z91Eux4TVFco1KI8VR+4oIIV0fuQe7L3ujJPFMFTtoc2eGZuEyr
	gsL9rXOn28hQQY7NgMriOr4Q36elkaqMuw+cG2yXmaSJE4VXX0gDEuWQ6RFoB7Hp2nQktpQg+rG
	JAWCX0cY2BEZVq6X/UTlZ/Jc9gkSloPqwUDkZfotccyyBqaa384O/amol7zAOobWjTdzoT1lr
X-Gm-Gg: AYBFou3PhVmkdP8yTUS/2MAYh/az/arZfG+wNAc0zZHL/TVvZ0axYv+tHWCuFZcbo3T
	gpbpFQ/Qz7UKHYEz2w6Js6u5GweznZ7NpBqWpZw0UHsguDkzVBFELcl74kD6nqC7GYF2De7wivw
	glGpsKF4dAmep3PFTpxHuyUcqUlf3q3KTXA8S/0GW5smvse0huwN1KG97LpAsVr8/P4KB+vm8xq
	nBwcxFNUFnHkIC196iGNlyI++Su8UxZaak8BI65q9grFfssp2lPoyaZm8prtmEadItZMjDO8NQf
	kT/dYS3dItTyFSFjIKuX2ks+pP10TWpL4KN4TZ+h5y5lydkHmO2+ZVKRiUNIWtV60+a7+ja3KTX
	BMbwQHePOP/4sXr1t1RdP2GvJHeZSsA9P2VZPnTn/HxIksVBbrjqZWLJG0Jczw/j8t4iLvcD8vA
	JbULieuzztFUbTgVasF/Ef3NUSsalR
X-Received: by 2002:a05:7022:ed02:b0:147:8a40:cdf3 with SMTP id a92af1059eb24-1b543d2db5dmr2489877c88.24.1795021255986;
        Wed, 18 Nov 2026 09:00:55 -0800 (PST)
X-Received: by 2002:a05:7022:ed02:b0:147:8a40:cdf3 with SMTP id a92af1059eb24-1b543d2db5dmr2489841c88.24.1795021255048;
        Wed, 18 Nov 2026 09:00:55 -0800 (PST)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5447f4e19sm11075662c88.13.2026.11.18.09.00.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 09:00:53 -0800 (PST)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: ath12k@lists.infradead.org,
        Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com>
In-Reply-To: <20261118071305.1823524-1-vignesh.viswanathan@oss.qualcomm.com>
References: <20261118071305.1823524-1-vignesh.viswanathan@oss.qualcomm.com>
Subject: Re: [PATCH] .mailmap: Add entry for Vignesh Viswanathan
Message-Id: <179502125375.3425953.10507014137065801405.b4-ty@b4>
Date: Wed, 18 Nov 2026 09:00:53 -0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0
X-Authority-Analysis: v=2.4 cv=b8UncdGx c=1 sm=1 tr=0 ts=6afdd9c9 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=78kwS8bwUcOx4deSGmwA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: WUzxq1jSW0QP07ekWkGIMRWaGmD7v8bO
X-Proofpoint-ORIG-GUID: WUzxq1jSW0QP07ekWkGIMRWaGmD7v8bO
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDA2NyBTYWx0ZWRfX0t1YvgnCJjsl
 pci4io2OTAw9+M4P7hDCEP0+piPLqlcCW/ciofaoHim3cg+SnYP1EqssRyNUxnsqCJDy2NWbE9i
 2OqwBuKc1qN7POgikOjqcVy2gvfDhts=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDA2NyBTYWx0ZWRfXx3DNlwfdq8QF
 3F93FOEYPhErjj3v+qdYLdJQBOOOl41Cv4gro4Ub+xo2qA+xVEUGX4CAsqvLQ+cE0dGEnsIQv2w
 vYYtXKQ8EBFQMrzq5lUmVzlPcM7BlkQM/IHdoLlg7xDMjmXmpJgwUzz9vJF5cPNo+cn1lk7lbVL
 SpiKpaUTXYQo2qnTgdqxL/5T5Y82KuN40VeDw2sa3uTLebrRPiurTw+CfZH24EgdgXBthJvY8mA
 qIA2AOAo6bUifeqFv7mHuMM0fVZmOHjC7ULGyQDBQ9vyflzPbSA4sr9sLKTXup7u4Hqwuqb3YwL
 vJwo3Jz1k+ci+mIRWg7RMCeN3TPezC0qmH1v8uRs5XUeKqPgrRzAWHzWRurS71uJBegqKXmR4GW
 e9jKncVrU6HVIE+Hxbj5vfom3WgbcsVbRITcDyIYAgVQq1l2MPot/+rxlhCAY7+oUerD3mB0GuU
 JcOkTnzBe85QlhN9ctQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_04,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 malwarescore=0 adultscore=0 spamscore=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180067
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_170059_530542_1AF76CF4 
X-CRM114-Status: UNSURE (   7.47  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -0.9 (/)
X-BeenThere: ath12k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath12k.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/ath12k/>
List-Post: <mailto:ath12k@lists.infradead.org>
List-Help: <mailto:ath12k-request@lists.infradead.org?subject=help>
List-Subscribe: <https://lists.infradead.org/mailman/listinfo/ath12k>,
 <mailto:ath12k-request@lists.infradead.org?subject=subscribe>
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On Wed, 18 Nov 2026 12:43:05 +0530, Vignesh Viswanathan wrote:
> Map my previous email address to the current active email address.

Applied, thanks!

[1/1] .mailmap: Add entry for Vignesh Viswanathan
      commit: 1983b40acfcb3c3464b291c85977290a785bcfdc

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


