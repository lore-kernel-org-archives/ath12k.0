Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF774606A888
	for <ath12k@archiver.kernel.org>; Mon, 16 Nov 2026 22:38:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1YfMM0pR;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GJwuWhqz;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MW+a+wrF
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=7RwrgggT8kUDB4j6O0/2/v7/3NHl4QTpaLDW0rzJoxk=; b=1YfMM0pRAvypU7
	Q0v9d+yqmOyAff0PKgL10QtesGsvKB7qPeIQsh/1Vd78hphx1A59N8Aek+LpGpxRvs8HLvRT1EXgi
	JSu2lXco4J6k9AlJShSHZMNROKMJZNFr/hYRynWH44a+wOBgAUJUDfAC3bGeJiG9VgOw35uEBTwUv
	sqC7Nhkrm6HK+p932SLM9KM/TvfJCIGjBad2pvQgyEZ+OKy3V9a6CU6IJ0JygPnW7mm2eZf0F9Uhl
	LVl20CQwqC6lyyZXEq57rVdwgxwMfeuM++pp1WhlxhH+XLh2jXlMqKQNbgN06+YxOXP9Q1yECqZ1j
	K/j4riI+UJYuVvAwrLVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT5L7-000000044AJ-3Lfi;
	Mon, 16 Nov 2026 22:38:17 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT5L5-0000000449N-2IDS
	for ath12k@lists.infradead.org;
	Mon, 16 Nov 2026 22:38:16 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AGJfaeM912958
	for <ath12k@lists.infradead.org>; Mon, 16 Nov 2026 22:38:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7RwrgggT8kUDB4j6O0/2/v7/3NHl4QTpaLDW0rzJoxk=; b=GJwuWhqzOgPsF4DM
	0IrtUiO5xOdmG+UajvM1kukqhnXM1OcauElHnymTnRfQaR9XMjxZeJKhOEf7FN5C
	710Qok8rcMaydDBc1xq72qm/gP3swer/rv3lMPHyzIeE58QPaFrUoAywdXzl9PNd
	kqE2EIj0ox+3LHKA6XI/4vPynHowR/EuVqRgTkvlURZvMTGx3l+I5tG8+tcKicCP
	3OAh4Hb2Ygc7NkjtdhLUbr7SIeBCZNMTKLYeKjUL6Jwmcw4zxYhB+APVDtHnV9cV
	q1m7KntFUaaNLJb4GzpLd9Ya5aEsdawNRwyt1IQgTyZ3pkm3AGARsP8Ktt1B26s2
	rn/LKg==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j034y20e2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 16 Nov 2026 22:38:14 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso5714653eec.1
        for <ath12k@lists.infradead.org>; Mon, 16 Nov 2026 14:38:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794868694; x=1795473494; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7RwrgggT8kUDB4j6O0/2/v7/3NHl4QTpaLDW0rzJoxk=;
        b=MW+a+wrF0YiSg3bR+lG8RkBzpxTdhvdqEIc3kMpfjY3nOzutwa2u8iKvO77xZhggwX
         /wTx1PeN8oEaPcrY+n2meQLK3gT+kKIiW4QT8d8KJRR5Ian3vU/W4PYGjgcP/zvX+bJy
         tC5D6e+4a2E4QrVfg1KkGo1ANCoz5WImMB6q7cWIAVWUZFggHatB1q2gODywoAfw66jR
         NUCc3fi1CXbQSYIdjzK7bSXL+n0kKQUIebf4ay7rvXJ8zjXq0A1ApK0voOaFdfJGgcZw
         bufK3F4RQAlkTCSKyAwirze8ffnTLwRzQFPxDwt4uvVtQ/Gp7GwMw3z1+3TJFqFexb2k
         LMXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794868694; x=1795473494;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:to:from:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7RwrgggT8kUDB4j6O0/2/v7/3NHl4QTpaLDW0rzJoxk=;
        b=APBO1RNmAhrHv2HAl/7Wy1C8k5s1b2l9PX5QraybFHESKQqycI9nef3pgEcz8QI8W/
         5QNhCKvQ56+smSL6MatyqzXPsYPi9f+NZ+t2hiHUPZqjWxK48JCw1l/y9DlBBOXnDQWU
         9naZcvVdzxwGt/YkCS0BUuN05M533CUk4+plJxCdTtsXVyBeADTs+oGh5dCVOAsAQifb
         daQiCElvm1EH0obMR742YDjPCObDDXFjleIYcJVm6sSGQ1m48HfZWQGHgxdmp6IW1YoQ
         Mqw22Rf3MLKKQT1Be6RdX0NJcNYJqBiCmLdIqPwYTLATz97A8H49BOdg+ULQdF0hUrdd
         eolQ==
X-Gm-Message-State: APuU4Z+CxZdiG+zGIoCRs1ZXS6n0pImPGaSI2Yob0zjlXZeI78mSTqkx
	5+aBVlNC+Gw6BmJHgoJJn33yk9Wk7GLBXuA1GZ0OLtrrqxIucdg+Z5MirWtk4pkE+R7Eq7OMoLU
	CajW5aCoSWxPpnclpohu4gjSeywZdLpAWlq37OsL1xlOIkf8bIXC7EJUd2dpWsGr7gDps96kh
X-Gm-Gg: AZFdTZforj38w/mMAQ66X7hIpd+TlmWOsTo9htx1wsu1nYDV9vr3JxbbuYPmqimct1m
	t/L/vtZqFYJYZBl8IhiFm3cQ/kXxIBksL56PpGHqs1BAVn+CS6TIqCXAr8qR6uD1YPZEM6KayEZ
	7iKpv+V4af0z1N1EK7CkzgHjIn4hT8VBDD03rDemytp6u7Ug6dR4E0oI0yhaHop7CVhEL0b/Sla
	47n6wckH9+o6o6YFhWirp67oFtcuIeSSQa5i5Y8fZ7JeYpONfM4M192LmvbgrEGOg/hAt0SlDdg
	V3Yh2ZjXQvUF0b9dUgf9Sl17s2AWfeQicuBUiVKHvb5U60BYvYEf+Vt6oCjdynoxbKDvh6UImoc
	8utW3bUZ6jY0UshbSGyUCkhalAFz5rnOVZkZCt61MhzHSwQOKGaHAwaIIWxb9LcKBVJYWqrJMzB
	YP7W8Zj4ahdAlj/UXfJiy50LnVTVc=
X-Received: by 2002:a05:693c:6219:b0:377:1ad4:1947 with SMTP id 5a478bee46e88-379659c685dmr10275524eec.6.1794868694086;
        Mon, 16 Nov 2026 14:38:14 -0800 (PST)
X-Received: by 2002:a05:693c:6219:b0:377:1ad4:1947 with SMTP id 5a478bee46e88-379659c685dmr10275508eec.6.1794868693436;
        Mon, 16 Nov 2026 14:38:13 -0800 (PST)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37955332ae7sm56671938eec.8.2026.11.16.14.38.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 14:38:12 -0800 (PST)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: ath12k@lists.infradead.org, P Praneesh <praneesh.p@oss.qualcomm.com>
In-Reply-To: <20261116085737.53041-1-praneesh.p@oss.qualcomm.com>
References: <20261116085737.53041-1-praneesh.p@oss.qualcomm.com>
Subject: Re: [PATCH] .mailmap: add entries for P Praneesh
Message-Id: <179486869272.378600.14272167770902583577.b4-ty@b4>
Date: Mon, 16 Nov 2026 14:38:12 -0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0
X-Proofpoint-GUID: z05SI14NY3PJfgFtGRY-bZSGL9v-Jkso
X-Authority-Analysis: v=2.4 cv=aNZlOr9m c=1 sm=1 tr=0 ts=6afb85d7 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=vG3Q0bkTwpdgWeGW3WQA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-ORIG-GUID: z05SI14NY3PJfgFtGRY-bZSGL9v-Jkso
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDA5MCBTYWx0ZWRfX1w2Uhx0aUL9g
 VGYn9dPYQXrUAvsUOs9cfy4Gi2Y2g8Z4svAOqGf45Clvxi0Q3ti/cpL8JwK1NaJa+/z7uOZzBAz
 1FYwrb2WbJkSoVMgR/N/t9PDobajqTQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDA5MCBTYWx0ZWRfX5HBfRCRyHtSR
 ZEVUSksvjjmo6QoCAxw8lZQswY5hK1T9PscWwxaCvldVwRRS4c3NNDe5yJZXUq3BGNtW6zDFPcz
 +NXKkjtL9HxJXWbdCihAPRYZ8aBogfnbHnTbsKkkfAb2F1vvkt50cqOwsM98wCI5QskSQAH8cwa
 +fFrStlWZoo+GNZRdBZHvIB6z2BqyGM+ToggnErpuTCmaFRThXBcTQ1IXc2ft2tSYRPiHxBc/7n
 XgSwQ4jBlrjylFUA+eskkiUpQ+Msy8zPgcFy1iS7OU/yKD2hJY7F27/gVTbIJlgAvUFHEKLdPgI
 QCxJhjL2hGFpg+axcgjWpOtecATqp60j+1spNrdI5QWgUIjtVE2q90LdmEbrTK5cAnkeSL494w1
 FqbNbKtbQZn5fDhtd9VppKpVwBVFeXmcqhayHiUF3FLASI53Gb6azfFKnlmgpOY96DH92syCM+N
 OBEWmJL/NkbjD4IlfAA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_06,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 spamscore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611160090
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_143815_594644_58EBB6D4 
X-CRM114-Status: UNSURE (   6.42  )
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


On Mon, 16 Nov 2026 14:27:34 +0530, P Praneesh wrote:
> Map past iterations of my e-mail addresses to the current one.

Applied, thanks!

[1/1] .mailmap: add entries for P Praneesh
      commit: 19c6698804318844fbcdde2d591db86ee20474f6

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


