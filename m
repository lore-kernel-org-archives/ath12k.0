Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0576D606A33B
	for <ath12k@archiver.kernel.org>; Wed, 18 Nov 2026 17:00:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=aUnmhshA;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Tx07EB+D;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=M6aBv8f5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=dNhJwFPPtdoCRs8+ziciKZh8qBoIfS1EyQ5l5B9WdSc=; b=aUnmhshAvbiTD/
	cMDVjG4p+hdCs+56xfxkuXs2ZYB9wYfxHsepIBZNANVm8Y8Al5CWtHfN+Fz6NEJI+P6CJyI/1JxfB
	oTvpqvQq+5fgCbi+cSXJYgNXlOBJwnmWMofYR+LO4Y7d7Pd0u3ULHpRtU0yXpRZ6gYvqzICGqekHI
	2rvGyJCHc+5e1VoTS0E93sZrlLl+RwWiX6EMsyKc9KXrFcwfCZ0XCXlcG90J8U2IjaGKrHQWpLqXn
	5ajyCPWZn8ueRvfVwK1PDCGmQJU6pOivfMNyOSlIUJ9jIr2kPCnF92+5tnSSBDC8et5ZU/ZGB+yqn
	swN/yp/3WNiFicj8SRHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTj0x-00000009eYW-2vWN;
	Wed, 18 Nov 2026 17:00:07 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTj0t-00000009eVS-3lFH
	for ath12k@lists.infradead.org;
	Wed, 18 Nov 2026 17:00:05 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AIGwLOJ3925903
	for <ath12k@lists.infradead.org>; Wed, 18 Nov 2026 17:00:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dNhJwFPPtdoCRs8+ziciKZh8qBoIfS1EyQ5l5B9WdSc=; b=Tx07EB+DJ6p1lrLB
	MTssd2/7alpNMCR1HGDawl/XpYljfvc5G6I8MH9DnUN0GakDL4wkp77Zad6V7+v9
	10NYg3fOk0ZkPbBv0yIJWExwnLudmxfXUlba/eHAbTwxzGkcmWTPlf5SwbnGb3UY
	FAlwkfIFfGP9U6QSec7pIPJJuIEnhHSPszeGswjdzz7cTNktwi4pkLNaxnkKnNfu
	/Rzk1qbntVgY9CfcynzMzm7PgY8B6vEIm5mjsyijiaDZsrZURRvmjS3PKOe2HdSd
	tJrLOv3us/YpFoCsxbVW/oTGh4pPL8NS9QFMFZO4gU+KXhktqrNsDXu/O1zboILp
	lBwblA==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1fgg0579-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 18 Nov 2026 17:00:00 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1b238436265so947677c88.1
        for <ath12k@lists.infradead.org>; Wed, 18 Nov 2026 09:00:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795021197; x=1795625997; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dNhJwFPPtdoCRs8+ziciKZh8qBoIfS1EyQ5l5B9WdSc=;
        b=M6aBv8f5SZFxsGkoBCQX/jgJZ0m+UXi4Om4ITjTAnrcUhIL2QwjX5cX+252lMszKc5
         9N+DUcIrXsU/u5/YXKW8YzJzUPD/bBAGfEgDAwIgpxle/OcoYO7s0d4vb/YMAChjF3mO
         D1EtLhYnXKccKGrqvufVC01Q7qyVYEM8otetaC3uH3yQE6Oomj1DVBENcIOLPs7e5ueR
         yzDaSzTvBjn6rKJ7rK4GXfVeQ7JmFVJO7t0u0J1EBL9+V1yXu0AMn/NE2rdtNABcwED1
         nHxOC0kzdkJm8HDUdqtVCiEd/3YTvb68vglwnTv2f+c1TqaDUEgcdVFp260qjUjSkMY+
         g9AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795021197; x=1795625997;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:to:from:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=dNhJwFPPtdoCRs8+ziciKZh8qBoIfS1EyQ5l5B9WdSc=;
        b=FCxfnjqFF8bKabOG5igOHQfRbbAvVyJnbA+MgLCrq2UWqGvB7vm/8OeHgUCwLeweX1
         VN5ariN0wMwvKbAKc4hon3GEFZkGs28xQLR5K5w3y1CcMrulS4VEFIGoDN5oHhqKFsBZ
         TPnmcd7kFTDjJHl+1ZTmWkYleJTZxYg5b6n6iMJB6N70L0eXWm0DzakJfwJIf06i4QAD
         kKY9SQEiJfYSWI+rrqD1czezNKXiVMS5miZ5nYcGEb80FoUwGiDCJnuhFiRGmiva/a6v
         DiWJyZSHbbfb6LgHBjq8XtRhJg+AXlS2twtis/yNcpnwnal6fCf1wPHz3HH6E6uJ2QSw
         hqjQ==
X-Gm-Message-State: APuU4Z/QxtkaC5DFrJmkn0nAfDbTzBW4ATbpJ4Olq31iUgwQU7P6RciI
	+ipGU8IeWBvGaT5T9iZm9pcb6RJ3uPWnTwF5Qi/eCH84Ui20x0vx0i1goCUdmuzOJo/JrHBNqBE
	bdazGYRqigrypHN1WmwN6jpxV8VLkaHNuaU+OzVYpp3TzTrPnu25vhTJ0Cm0x7Qsc
X-Gm-Gg: AYBFou3srMCE62APY101CH/tHiUidVxZTg8wrl7tuvXtST/fv6Dfo657dB3VgPc8nII
	t03ot6nA4FIdKEk6yeNP3y4gbeN6KZE0pMUZNI+KThjFFHLnATmVaeQD0ZJ+t/KX/jdOT988+0k
	w9fscsAEJTVXD4EHCN6zA2Y1mIOUAKqvYDMG1crXGcYWrJ6vN6UgW0UhSKUBm+rK9O9RWOowx+9
	KsnkaXhRYnIL3He46Nyr7HSjqfoEQSYh5jc23KhmE+DNnMfy5ALQK5oNwOyujkBTzqx1D1vLauS
	EZ5oOyegvQSlo/Hhq2+769ZUosOE8XHMDdCqV00qpeanlcxUVFhcPnBiAVP53uR1V1ixO8ab2dh
	t+t1UoX/aJ0BwgdhFrGAHOYZ4wcYl1c3DZ2gbRtCVRlFrY47DSUervboXYxPJJ7JfZIBM/0aInW
	8cJkl5h6pMDUBJ2c4mVdNKgStK8IMI
X-Received: by 2002:a05:7022:1708:b0:1b2:4b42:1870 with SMTP id a92af1059eb24-1b543cff066mr2599826c88.31.1795021196380;
        Wed, 18 Nov 2026 08:59:56 -0800 (PST)
X-Received: by 2002:a05:7022:1708:b0:1b2:4b42:1870 with SMTP id a92af1059eb24-1b543cff066mr2599801c88.31.1795021195708;
        Wed, 18 Nov 2026 08:59:55 -0800 (PST)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5447f4e19sm11075662c88.13.2026.11.18.08.59.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 08:59:55 -0800 (PST)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: ath12k@lists.infradead.org, Sarika Sharma <sarika.sharma@oss.qualcomm.com>
In-Reply-To: <20261118053407.3089782-1-sarika.sharma@oss.qualcomm.com>
References: <20261118053407.3089782-1-sarika.sharma@oss.qualcomm.com>
Subject: Re: [PATCH] .mailmap: add entry for Sarika Sharma
Message-Id: <179502119505.3425953.16516170200687931278.b4-ty@b4>
Date: Wed, 18 Nov 2026 08:59:55 -0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0
X-Proofpoint-GUID: 9SQs8iis20rqKStKV4ZMWlA97wIDDn8U
X-Proofpoint-ORIG-GUID: 9SQs8iis20rqKStKV4ZMWlA97wIDDn8U
X-Authority-Analysis: v=2.4 cv=fOSsTpae c=1 sm=1 tr=0 ts=6afdd990 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=kt7a97lBjvHxlUSjVAMA:9 a=QEXdDO2ut3YA:10
 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDA2NyBTYWx0ZWRfX0nnnLjiYorf5
 eReSiZ4J7crSXCLiCYg9f/akQM+sXK64Oy7F2S8xsHcm/VCImJKTJ8n1j7vDVLBjiwQxdfdLDRz
 M697miZwg+QN+YCBLdxo3PEhzmNWoKc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDA2NyBTYWx0ZWRfX82Ra5QAlYeCY
 6mxnt8aiRp0GjhQTbzP7uQ6UNal4FcNG8sDVCcfhEXbIDR2yejn95lvGHL4Ln0MjG7nqBSrERCA
 1qWdFy6ec1NHyBW/6rTDgpm/oHCGqLCDjzznu7XPjmZhYloOPDhnOExp/4980OQas/eB4e9HDjg
 fM1H6I80GE3QeTRZsxuzOx9uYALWvNvKdh0KlE8A9SmPwh0QUDphWk4KpamDXAK92tPzwEh4LV8
 X3YrmffrJavJ1T1SgTSMIkCvzPaIV5RuJAxAGe17jVMWIEsc1aD6FjRRuQgs+qVs6Sau+EYG9pm
 vHzOS8Bp4KgrzPjyXWb1U2euwBdF5G89BnVwwHrHTuVESXDjfMkqYntKfNPh2S4Mn3APh4HoqcT
 T7uPtvIfP7C5vO7839MpBepwy7w6tdQ7uskg/RXqV+1TkdZYORflv7xJKWl4BcdDQkmQA756NBB
 xz9lrlNUkvY1VIR9N6w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_04,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 adultscore=0 impostorscore=0 bulkscore=0
 malwarescore=0 suspectscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180067
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_090004_139636_8D524D9D 
X-CRM114-Status: UNSURE (   6.12  )
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


On Wed, 18 Nov 2026 11:04:07 +0530, Sarika Sharma wrote:
> Map past iterations of my e-mail addresses to the current one.

Applied, thanks!

[1/1] .mailmap: add entry for Sarika Sharma
      commit: 61a81c3b80b538ce8e1f5c54621d522cf2827e30

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


