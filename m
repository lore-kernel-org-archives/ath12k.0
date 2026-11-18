Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07767606A331
	for <ath12k@archiver.kernel.org>; Wed, 18 Nov 2026 17:00:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=jrwgn9g3;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=H5PfAN3n;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=U7nDw+vh
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=mYb4jQpiJeud6tV7sqD0jjgMAi8k+e4bnAdj3jeM+CY=; b=jrwgn9g3kr4T/f
	umB6HUdmDqba6NTsl3dQTMaIWPHqlFdbwQ/k2mVz/jxYpPwrdEuPwycwOPwEeDnAo/y7z9JQfz1gc
	jOLLatLx36Szcc2+pomhOAUUiyi2AiGXLZIqjka9iO1zkv9i+JZl05/z6Hl6nZdw/jY3rtIp/Scl4
	8q+jdnKmYFOvo7mJBwZWSeeG4R/8dSWuOcjO69gGIhxi0sysb0g11Oel3E6oFQJxYe1D6BfCtjXEF
	Y0Iqr1TB1sYPpJUT8KOF8gRP6kOaNaZwe+zja43FY944BfqBcByVTB4gMisQIyClgMMW5ijGTVeMF
	ebdCZqcuwt4mS6DwqvAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTj1a-00000009eqv-3CvE;
	Wed, 18 Nov 2026 17:00:46 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTj1X-00000009ep7-2rtj
	for ath12k@lists.infradead.org;
	Wed, 18 Nov 2026 17:00:44 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AIGwkkw134716
	for <ath12k@lists.infradead.org>; Wed, 18 Nov 2026 17:00:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mYb4jQpiJeud6tV7sqD0jjgMAi8k+e4bnAdj3jeM+CY=; b=H5PfAN3nRiDv4+do
	p6qfAivfnfhqYgqw7yHh8hE9ZUYQ45hFPF67tw3uCrsA34zAi2wF0edF4v+Qwy41
	5cCvBlE1z9dsONKolBPqoG5loBpbsnZ1TZ1BHaBaEb8ndroOjU5PhsPLbLnfSb/q
	Sw/H/yQdBs+zxbk04tHDIpiiY6c621h13RmOPsiH0K6efyIIzJrH3kLCgVy0ykxX
	9C81B97475dg+1DrCVZ4qBLIEthdkZDs3t1GfhoPvJgJWfalUprC9y4hbWIkjAZ7
	LMIp0bLormGRTK8PR/oytD7cMn8HY/A6p61G8MpLUwqTJZvUIPCwwU+13G8gnVfE
	AKZbRg==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yvav5an-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 18 Nov 2026 17:00:43 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1383723dfddso1439344c88.0
        for <ath12k@lists.infradead.org>; Wed, 18 Nov 2026 09:00:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795021242; x=1795626042; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mYb4jQpiJeud6tV7sqD0jjgMAi8k+e4bnAdj3jeM+CY=;
        b=U7nDw+vhtNGISm7JLVjRV/tbIVz4BbA/RgeQH5VlkdJiSVXx8HQ0ZfxzF0Q5//5SbF
         w/yKnzqzXHmZK/HzJ7Va62uPKXiGMLOQuBNbguQ/Eh0bS0Ou6TyCSOPN+yjFMBL1Isz7
         +uGYDeu5y80+FXunDgdG3Bf1sGOy5pE3kuasL5PIjVippDBfuE8b+gS836s31pCtnIld
         a22/a4AWN//mJ6X5c23o/dZdI8nbjA+TvrhvoCaDTTeWSq4Z6/mNB1CFYp5gAIFx8MAC
         crbjcgBTM5oe1uceSLmIrol7KzuGysaMrTrV7beeMrzP0r30ohCWjJyrsdhqHmCiQDO1
         3U7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795021242; x=1795626042;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:to:from:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=mYb4jQpiJeud6tV7sqD0jjgMAi8k+e4bnAdj3jeM+CY=;
        b=x9IhVvHKEpTq4ZNWJJ+mnLq2f23lrLGbABAV+tP99rnIvhVnINMcyz0Rz673OlVLi/
         +STwHDs3FHZaUZP7Dl91Oiqe6h8mP76V6RCtpFKQN1eGoTYtEArLbu+PbbW6X3/M03gT
         yYECqBryI98ckr82DqeTAhO49m9za7h8OC2lCLOuRSPv5hhZxm99tkbRsUSs5N+z9xh9
         z/tvJmT9QfCxcS/h5zmY9JpYH+kixabqV4Xl0Q+o/s5cnnHzl9YY7eyV69H/5ChU2OOP
         IEDsvRIhUm2acJ2yQW8GoLJjg6yhDomEmXhXTI2uNvljvFAvjA1iDxRi9el4PGMCZYcs
         Iivw==
X-Gm-Message-State: APuU4Z83bXDhUUa3Q5ZJB5t7gUkzXWPTacBzpjmJbWvluu287XTqyqTX
	OMR7ges8l9QA4sZVcoP5mOQH4juLolV43nqWTYn0FmOb2H3I9xrGQsmy0RRPZi/faVTewFb3U0r
	PO72nJQVUNI+eSTcVvLTJddV5uH2Z5qNOePQOo710umVY+DfZWIUf/jtbHOYl9QfW
X-Gm-Gg: AYBFou1NYff4flA0Hx8rPY1KlBOSSNjIJWdZJdbisTxce/wlUrsgRaDkNlObIvqX07F
	Qnwrr5t1pob0wtPU+a3B29EBQqOy4X5znFz9UvJZmw3AcCcedTD3WPvo/dtT2sbPU+X9/VmaiWL
	OQf7kZcwYj/zPzp6HFnlYoMUxXm2h2laNfsfgY4TgkW1IbCHLqgkV7mBKRJWMGr3PTi27gfYaZC
	amEBzNUOlYE3bkBPFSUrfebu+4714wPmnqCqBgw1zSCk2QtBJN2t1I5xchEAwy0lSgzvksBbYNB
	Q9vnAPTlNKROOoMyp91xmW8ARwOu9XBan6U/fRDY86cJ5OvtJReoguc73AflVBL96E9XYuZNl2T
	RgvQXAFuY8a2ic2Dl2r4sA+WZOM7YW8e0uUo/U6IGDJcoYkgkhelE+Pmdb2xjmELlcAL9wzwQ/e
	WmwhNFJkKc0Y+HW0jOB7wYS+WSqgot
X-Received: by 2002:a05:701a:cca2:20b0:1b5:3b83:5374 with SMTP id a92af1059eb24-1b543d29a65mr3086421c88.19.1795021242216;
        Wed, 18 Nov 2026 09:00:42 -0800 (PST)
X-Received: by 2002:a05:701a:cca2:20b0:1b5:3b83:5374 with SMTP id a92af1059eb24-1b543d29a65mr3086118c88.19.1795021236916;
        Wed, 18 Nov 2026 09:00:36 -0800 (PST)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5447f4e19sm11075662c88.13.2026.11.18.09.00.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 09:00:35 -0800 (PST)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: ath12k@lists.infradead.org, Wei Zhang <wei.zhang@oss.qualcomm.com>
In-Reply-To: <20261118081130.1319688-1-wei.zhang@oss.qualcomm.com>
References: <20261118081130.1319688-1-wei.zhang@oss.qualcomm.com>
Subject: Re: [PATCH] .mailmap: add entry for Wei Zhang
Message-Id: <179502123563.3425953.15853666062532125703.b4-ty@b4>
Date: Wed, 18 Nov 2026 09:00:35 -0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0
X-Authority-Analysis: v=2.4 cv=SMzXx+vH c=1 sm=1 tr=0 ts=6afdd9bb cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=QCMqKkRf5zc4Ybws10gA:9 a=QEXdDO2ut3YA:10
 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-GUID: h09WdTOPjDloQWzLM3N7v85hikmKCJZA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDA2NyBTYWx0ZWRfX9nJ4xdwu7WWa
 ansRBcket3rQQe2V9ntdxVdbUTckh5o3ugmspXczuvxk7B+iHkzW2NqsSk3VplYgAON5VS3VXgD
 3T3iPRydWinUY16JNZvSUeGYkb++tExZ2okeRdakuyFNltzq7joNn8k7ngEtsDsOdkIN1K8R38a
 7n9LcCb8yHDirk+aMqLV4oIWOC8Jz9Hx9+jbURES2YkVpj0O29A8jvSMiaHehNTanzeNfDpAgDu
 IZi21IiMblcX/ERuFChv8khSVPdFqQJ/ISScls6nSthEbkX2mpuRg3TRfxYKGjYY0t7NaT1fZXY
 REUGxEo2yF4F+Lbx8WU/jR5Xr322Xrb0XYJCTxXV/6IT3zfe9bhlp+4fhMwQ4L9lfD11n1tyvI+
 fj0s8pfi6R6fcRulA3lkA4J/QHNOxJnwuCr7nJFqSQRqmKka2KqfNpte70XZI2GmmIhbcpIqhHZ
 lKuqCSHRpbOqW8xlmRw==
X-Proofpoint-ORIG-GUID: h09WdTOPjDloQWzLM3N7v85hikmKCJZA
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDA2NyBTYWx0ZWRfX66ukqZ/tObl/
 WRKE9xJDrnNKH6FUzIGYMampM+/cUfuNbUYUR+VjWKyHX4y8LalqhCwnn2TyiGtI5YCaI14kz82
 /kWGNicb70y4Nsd/kLQL92T6ZV42fNE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_04,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180067
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_090043_733190_1961FA4C 
X-CRM114-Status: UNSURE (   6.50  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.8 (--)
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


On Wed, 18 Nov 2026 16:11:30 +0800, Wei Zhang wrote:
> Map past iterations of my e-mail addresses to the current one.

Applied, thanks!

[1/1] .mailmap: add entry for Wei Zhang
      commit: a682859874922e91edee45d0039c162fc962bc55

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


