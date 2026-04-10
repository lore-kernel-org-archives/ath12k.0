Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 717FCF459F7
	for <ath12k@archiver.kernel.org>; Fri, 10 Apr 2026 16:26:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OlhlFH6bwXmezaphpwpChPsxmeGk2maLYkli/F30jLA=; b=rBkk15bsKyv+ABkcV4788oO2ZU
	LA18LXFgZL8Xy6c2HyXe5QZYQW/7kzdAViEipoPj3hIV0ZuIXQ9nk/wWBoCYT6SjMmDNLEAv6TQBe
	2xz9ZIg81N9+BNff7tTKPTjB77DdzPhIuijTQ3IkSzxadlyY579I7rntJB1EP/EQDbQNwEeiSsc9e
	52dBQ8k1Jrzj39/oNkCcv6jgZeYmxJNLw/WVPZmEGyLieu1jy0agy2cy4PSfPQohENoZWlSpOYkq4
	WtZJkOrYKB82rREpzSt0Xrn2mEL/aGx2FjvouDj5ZpctOY5OvzS7uDme8kZfy5OT2+n/Jz4MYevBN
	svXh+hYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBEgH-0000000CXU6-0nTe;
	Fri, 10 Apr 2026 16:26:05 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBEgF-0000000CXTk-0Y8b
	for ath12k@bombadil.infradead.org;
	Fri, 10 Apr 2026 16:26:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=OlhlFH6bwXmezaphpwpChPsxmeGk2maLYkli/F30jLA=; b=MdJmvf5XLTXMY3w2Rmz6BvrxvO
	ZqImcyNddnT4EdF0047KGuogF1MG5xbFH5U1kLbr3SfiDAqDX9Wnsx7JUbqJiIOjoj1W3xKeGyfvL
	RYX+RQRyLSTq6PTfGF6lCpSa+K/P12MYjne4fH2jZlk3Cq+rAG1He6RC1+4ftfGi8I7+R8YFdH3Hb
	B2tj0Zo7z0B6eO8F5iKQrm39WpzfBzldfTx8KcuqkuIarWHYbjJrgqG/LaIFxx5EUi79zmDD4MHA0
	lKNhohHQA2j0XN7TkXYQusG47pouSi8ZPI7kdkm6jv0Z9l0P+sx8owICrNYRPjwn6c27X5sWnfTqo
	JhBQbipg==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBEgB-0000000DuQK-42fL
	for ath12k@lists.infradead.org;
	Fri, 10 Apr 2026 16:26:01 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63AA626U017417
	for <ath12k@lists.infradead.org>; Fri, 10 Apr 2026 16:25:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OlhlFH6bwXmezaphpwpChPsxmeGk2maLYkli/F30jLA=; b=I4fI0yvCiDreY0uT
	/e0axn0L+EgAhLSeLcPIz9LH0owbOHaU808gIIp16WyYMYpBVAH2oAKz7pcymgMa
	G5ydGOzAZzVa7RnyoP9pZSb6hfF32qpWPTu/vgPVSrz+FnN/fMM180zle56rx8Rk
	fsH0sKvosuxyylxSY/bBbszMOxqE45dWQMnTjn0VBoybd2iWvjopVCvfaiqUTwxW
	Ec3Qrftgo38a3+dfcvlOFhtHWv0vqctX9cCZAVmTBzH6WKT0d9ry5mxiXbW1ebvd
	rMzrNJp9UeUMukdwVs+V353jKyR3BTP0upOYCBWzgN1Tiz4TgwDA22APlXtg3E/N
	ojOFlQ==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dey5j16rv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 10 Apr 2026 16:25:55 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1276e71652fso3194909c88.0
        for <ath12k@lists.infradead.org>; Fri, 10 Apr 2026 09:25:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775838354; x=1776443154; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OlhlFH6bwXmezaphpwpChPsxmeGk2maLYkli/F30jLA=;
        b=MMXV1mBXW+/Gjf0LuN6dUvriKZLK50Tq9DJpfWbhZQ4DH74q2GG5gllSTI/MGZWfO8
         mBtumwucyg4iMZduLVLzXhSLGg0XAi22q6Ev4+NuXbKqkpTDQ8T+u8MwVVez1Fp3kZK3
         t8Z7Dpw49B04+b9l6hR99I2wYtDhmRu8fZxtMqCVPkMNFe0wRn8h9YUyUhb6UeuT7mxr
         kW2cNEzswVyyQd+2XuyIgHlftN4ZWw0Yic71mxTyjmnL/q3zsl4FmGaSxsXXt/oPHesU
         nAyq3cl1AeyNx6j3fiNO21JWNtoCygQONT8dr6gjlR6bdWaKRy1PxKvFj5W51Kar6/yb
         3cNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775838354; x=1776443154;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OlhlFH6bwXmezaphpwpChPsxmeGk2maLYkli/F30jLA=;
        b=XtB65wn+K0Ubqne8ibdhwmJ8TTo32JH6iCYv3GP9IORHHGGgepwD3q+7jj1Va/WRqe
         xLIqwBCHLtONKdN5q0mie/SuaBEw3grpy590pIa7oxfc2f1Y17SgP2hBN4v9IUGbXbgw
         8YuXdFd+pWtp8YN3Fdw+eiXl+C/laZ+2JnMHiqcxL95fh9kxIBLOxEKJf0wY3SRCsQ1u
         zyf6kfooWXLZEgycFwME2v3LYHh6PpSOy2iWuXT3byfBGexSnFVCiQaFQ/uiy6+2k4yo
         EfZu2D4du/qymYZ+yxxF7RVYTb4IvESQWbXrZjGRdbb64TpB9ROYk7gBD/+HYAMtp6o9
         nUAA==
X-Gm-Message-State: AOJu0YyK8nKajrqelbSiWYauAf+WDxsxYIWr/0v8vkUkyKKGo0c6Qfv0
	dNJtuEGLWuXcUpGObaAlKZ+9Qc/K0ogs7woB/SvtAshS4ER+ofBGEmZLaC/8jBsTb4tsOndzhb5
	fTROEFctJgJB22k2zkoOnsw/Idc9Tz6XonDM7clOlqD/T/5eAIP6PGKFowXofdt4j+069lJTT
X-Gm-Gg: AeBDieuTHJCG6HSR20qWVmErsSEPEz+6pBSMf7kOThij0kUNmqGg5kYVnha+uKTwpeU
	C8MjA0YKdH8/PAy2I0Urz5r+oATtr8uwVb4FJqLIZ4Y5tPTwxf3VN5u0xJ47pmcqI2gUQR5kyhI
	onw9lIWcekh7kd1m5OpwPk0hBAuIvanr9VUPL3R9G22XCvtRRafKlkjt2xi7/EYvAXliTu8+TcV
	mfLmnlv/N84WAe53Q1IgAVI4lpqnIbFa/IImQWhl+o5qMHtSvsDxvIUGid2zOKXAe8Q1Zorw6Rj
	xu1Ew9M+t4yVAMGMUBuR/SSGj8R5OeW03ecS3DdQ4RC91Xc+i99is5YdWQWSN9E6b5RU0MDNhmK
	F0oh5Dz4rhkCHkY9kXGnrPFgrY9U3WaDy3fxhMouQG/UxMZsfytfoV6ahefMdX8TBtT9rYQ5A5X
	Wj
X-Received: by 2002:a05:7022:6088:b0:12a:6fb7:8801 with SMTP id a92af1059eb24-12c34eb603bmr2209337c88.14.1775838353776;
        Fri, 10 Apr 2026 09:25:53 -0700 (PDT)
X-Received: by 2002:a05:7022:6088:b0:12a:6fb7:8801 with SMTP id a92af1059eb24-12c34eb603bmr2209311c88.14.1775838353133;
        Fri, 10 Apr 2026 09:25:53 -0700 (PDT)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2d561cd2c09sm6023181eec.18.2026.04.10.09.25.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 09:25:52 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: ath12k@lists.infradead.org, Nicolas Escande <nico.escande@gmail.com>
Cc: linux-wireless@vger.kernel.org
In-Reply-To: <20260407095426.3285574-1-nico.escande@gmail.com>
References: <20260407095426.3285574-1-nico.escande@gmail.com>
Subject: Re: [PATCH ath-next v7] wifi: ath12k: avoid dynamic alloc when
 parsing wmi tb
Message-Id: <177583835249.339192.7078755593589068510.b4-ty@oss.qualcomm.com>
Date: Fri, 10 Apr 2026 09:25:52 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: UUUoDhflFMliPrRabZdYcUNs1mxQ3zvk
X-Authority-Analysis: v=2.4 cv=b9aCJNGx c=1 sm=1 tr=0 ts=69d92493 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=UDkKdCGfVg8aM8bNbj8A:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-ORIG-GUID: UUUoDhflFMliPrRabZdYcUNs1mxQ3zvk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEwMDE1NCBTYWx0ZWRfXx7sfz6pLLYUc
 aNF9kyLkixrmPmoxRVsCG5Vfs8uh7nMbHx0jI+ThC/Lt23NFYsD9dnKQlhTEFKpFZJQYlK6yNW1
 4Q2Ioipz+LZ/8vIXZVkTaG9MANE5KtrRH6SFMiCInW+2gT/wuzjbZOe04/pf3fd9SPpTJL0EP6G
 Se1blor/XFCrprplywuRww6F2WwSlTgm9DA/78NzHlCo1fEY7LDJTWDcab0tc+iiaWvlVGrrp0V
 2nIhYZF/CAbY6Q4Nzdj9TtfIEY7CjtmwIrbwWsy2o+Ebiwz3W+1m4dSn7SnXbqiJO7sMdnwePUs
 g3mK1wALndsWig+xjuTeqNJ/tNpFDvw+1ra7O8Dr4gmgKjIpWlCGOSFSJWI8bpChyzDckCj2BoS
 DPQrtI0FB9TSKWMJXSNxNahoNViqMkpC3T/uSJ/zrlW6aSp0PpUs9cdO7UoOe9cjGuq1dtcvYwp
 YN2IO0/7Ldy8km6HTUw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-10_04,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 phishscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604100154
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260410_172600_293258_6BBDCECA 
X-CRM114-Status: GOOD (  10.28  )
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


On Tue, 07 Apr 2026 11:54:26 +0200, Nicolas Escande wrote:
> On each WMI message received from the hardware, we alloc a temporary array
> of WMI_TAG_MAX entries of type void *. This array is then populated with
> pointers of parsed structs depending on the WMI type, and then freed. This
> alloc can fail when memory pressure in the system is high enough.
> 
> Given the fact that it is scheduled in softirq with the system_bh_wq, we
> should not be able to parse more than one WMI message per CPU at any time.
> 
> [...]

Applied, thanks!

[1/1] wifi: ath12k: avoid dynamic alloc when parsing wmi tb
      commit: 9a4f673eb08d2a7713b258d671b4a45f2a6e68b7

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


