Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4FA6E77180
	for <ath12k@archiver.kernel.org>; Tue, 10 Dec 2024 18:07:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dGHBUJEYBr356j6+oSTrO5xo5qtS8kuwOo5FJXk4Xzc=; b=lwZsPus0zmJRI8v4hSehh+95oX
	98yYbiflL1cfzwE9DVtfNkFPQb+1oUUj4Z/oxqixR0hiQEXjroIixTGjN0MuMkQEVj/GanrFZF+dU
	sd6IBUfEAyH8zxf2pWxYa+add7K3j9dIIhoRHMHD0cBzSdZW6BNVr6Q0WUaFGFEy4lR9HsBIXaqdu
	uDOoFlfkGNi5kn13Nn/R8VZgfjSTjuujluY3kJJ1jG3le0rxOVb9erbjipwZ2TiP8kOl3Zs/NMW7U
	WwkhVtgE14uufua8RH5KBwoNzidkQLdjmjCMfGSigFXooOr62f1KfCla/EMU2mzVMy4dSwsFFwdWj
	Fmei0XIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tL4di-0000000CMdh-25w8
	for ath12k@archiver.kernel.org;
	Tue, 10 Dec 2024 18:07:18 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tL4de-0000000CMct-1tF7
	for ath12k@lists.infradead.org;
	Tue, 10 Dec 2024 18:07:16 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BAADD9N017424
	for <ath12k@lists.infradead.org>; Tue, 10 Dec 2024 18:07:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dGHBUJEYBr356j6+oSTrO5xo5qtS8kuwOo5FJXk4Xzc=; b=TllGQNU8HP9D6DN3
	sOyEi3qO6a3BZOlAHhanYSmrvw6P46uMdZnfDmEU6nIjI+fS0pM7g5PWLdG3HlMv
	U7XXNiIBESYnalfDysbw2VV+G1EzuOgrzbLWB26ftVRkSrf6Ty+xGksuxqaiN9tY
	/pRArr0z5JXXx8CMVHXGSqz7wRllSjoUbLWnvKHZ3I1f341iO2rJNPdbi8jp3RSt
	TD5oXe7j5Yg7oNJ5HDPI3xRT7Tu7vxmJnpKW0oiqPLa0dIJZq5ElNiVRBij9YkNM
	9w355VGT2IEssa6TXne4ToM7PQWQflK4K85pCs/Guqu+s4qG/H+dsGAbLJYkH1ld
	enak1g==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43eak3av6p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 10 Dec 2024 18:07:13 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2166464e236so25760385ad.1
        for <ath12k@lists.infradead.org>; Tue, 10 Dec 2024 10:07:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733854032; x=1734458832;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dGHBUJEYBr356j6+oSTrO5xo5qtS8kuwOo5FJXk4Xzc=;
        b=Yhj0OVS5js5fmlhkvy9MFYLB6kbJ/9YASgCFKnpoDcKrGpA4NHWuPzpqgO13jP/E3L
         O90FW3vYCJNdiFpaO4EoL/z8L3wiMqFr01eHPAGjvmb6z7Kh+c8G+citBGtbZ2eGOpm0
         lAYyvkcqIFQ/WXcYEyuqoZxbUSp28Ej9Tqxkgs6JB9WwF/3NKDeUu9DaW1jQAdoJ1iX2
         EElF3fm+FdWbbz9fjLIOeTTDZc8jJ/R1U002RpQNHIyq+KGSnr4c2YSe7Cx2Cb1Tn4Qp
         vEcWasMkxFw0eisjVKECz5busEe+KMVGG2WTSaWgsvZiHIvit+e4XM40MmRq/ha6h/AN
         ffYg==
X-Gm-Message-State: AOJu0YzLWS+CEO1nQYbxi10VmHRk9oYydEPfPcuLGVjVKZrdyzOexyv6
	tR9DhGB2lrX8hZXmId0OS4x6wou2t+kzdHhvD9vYGx5EqbPHOu2Tk+Nba0u8ltEJtUBYoaoelsD
	Vi2jFIx2uPqWdofEBPCVZSoImuBf1Cu35CxwaFYlYtH3NA/m6krkZSoj8DofAatMduKml
X-Gm-Gg: ASbGnct3uqQbxIq6VziAfI/BWNl7525D96K3/bpfZvVspCXW6Ek+dpKyJxw8vrs7eFH
	dVP13VP5cd0hhrO4l7PDOfi5CetOjUaIcY27936lx2/e5bUwi4GkuEygjJexvzGVcslGniQRIii
	HiCKr2eLbUb5m2NRpcFjgW33dkyyRWJilRSlouDVT6HUXXkszadJQJPYKnct3WZY3KwhByHJI1+
	qym9209JaTlAwkNMhMR5nmfm0RRplNJ07QcYC2Z+OLs5exkcQ1MmyAgMX2T7bj7wXOE82yg0x1l
	t2N91L8fs8Hnp5O8RP72RmuzJN7Tzr/jew==
X-Received: by 2002:a17:902:eccd:b0:215:a179:14ca with SMTP id d9443c01a7336-217785200b9mr848165ad.2.1733854031884;
        Tue, 10 Dec 2024 10:07:11 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFp7VYLe+NLIgsvTsHNuWvjlP/hwlkLHCgAm0s4PgKJ5HKJUPiu/3pi4323nMz4BayKDN+lBA==
X-Received: by 2002:a17:902:eccd:b0:215:a179:14ca with SMTP id d9443c01a7336-217785200b9mr847835ad.2.1733854031505;
        Tue, 10 Dec 2024 10:07:11 -0800 (PST)
Received: from [10.227.110.203] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-215f8f0a886sm90433555ad.208.2024.12.10.10.07.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Dec 2024 10:07:11 -0800 (PST)
Message-ID: <2b3e0c2a-ea9a-4312-b4b1-00783e80b337@oss.qualcomm.com>
Date: Tue, 10 Dec 2024 10:07:10 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [bug report] wifi: ath12k: move struct ath12k_hw from per device
 to group
To: Dan Carpenter <dan.carpenter@linaro.org>,
        Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
Cc: ath12k@lists.infradead.org
References: <3e705de0-67d1-4437-97ff-4828d83ae2af@stanley.mountain>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <3e705de0-67d1-4437-97ff-4828d83ae2af@stanley.mountain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: xsRlXOxmJWxnfQa5Jil8senC85peOx5C
X-Proofpoint-GUID: xsRlXOxmJWxnfQa5Jil8senC85peOx5C
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 mlxlogscore=934 clxscore=1015 spamscore=0 mlxscore=0 impostorscore=0
 malwarescore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 bulkscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412100133
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_100714_499494_22B609F3 
X-CRM114-Status: UNSURE (   7.71  )
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

On 12/10/2024 12:34 AM, Dan Carpenter wrote:
> Hello Karthikeyan Periyasamy,
> 
> Commit a343d97f27f5 ("wifi: ath12k: move struct ath12k_hw from per
> device to group") from Dec 4, 2024 (linux-next), leads to the
> following Smatch static checker warning:
> 
> 	drivers/net/wireless/ath/ath12k/mac.c:10938 ath12k_mac_destroy()
> 	error: we previously assumed 'ab' could be null (see line 10927)

For completeness this is also flagged here:
https://scan7.scan.coverity.com/#/project-view/52682/11354?selectedIssue=1602340


