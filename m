Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2A7DC3ABD8
	for <ath12k@archiver.kernel.org>; Fri, 16 May 2025 20:39:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Dsl1htn5szVmt/DjssSO8gALKifNfg7gundf833ygfU=; b=D9xfp5i+/7EShg2+nnNIarGO1W
	QmSUZ+oqyh0TxcFUfKfWK/hoSCEpALeveosK1T5QLbiUds+a+NLyMQOTeknTnbONL+tyX8Yoe7wwq
	gl5SGlRT3rtYYb/De86fUZbgOQpqrjBRuYZEibt8S0ALotpP+EX1XZ3wpYBRX2lD1gR8ZuHKegA6g
	DfWWPIeKA/3KfYSxHcJxvRwFXs5yNDtW0sRLnkN1klBPw8jClG9MAzK5ZQnCe4Zm3eqEfv36uRQmo
	JXIH77RdQadtrbTJESj7zSkeGYp+7wbfrPqKJ6X0Yof2a7l18nL7i3ouzcwOaiu6raP6JFL7FXhw6
	WzLPwx9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uG1q4-00000004aAN-1u4p;
	Fri, 16 May 2025 20:39:28 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uG1q1-00000004aA0-3GWt
	for ath12k@lists.infradead.org;
	Fri, 16 May 2025 20:39:27 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54GAh7Q3032612
	for <ath12k@lists.infradead.org>; Fri, 16 May 2025 20:39:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Dsl1htn5szVmt/DjssSO8gALKifNfg7gundf833ygfU=; b=Y/79+x6hffeZmx1J
	is5kjy3nCCGZ10Di9VsAYgqQWQ64UspceMlvaoIbatzzbT/sYVkjJ1Cjxwl4rWAR
	wwYCa2AqgJI3fWhxZ1pVKnhJYLd0cUCNpW8xA8RT6D/Jf+LZq/92jqSUGuu6gGhJ
	5pz8kvNz3DVSg7XQfW4B+0BNZ2bxoPg0gS9vBarbhUYiRo/ZXTnHgQ2cQ1Cg8GCa
	5NDD26VK5JFZ64TnXbXqEl0KHLP9tWc3runphjIp9Q4SIZhTgzow6maMW9wZC9PT
	RRe+3HW2sEaljdHDbZbroG34EACq2jSYNsvsc9KknzxuCrJ65CM65oYF2Ji9WUun
	h/ljsQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcp32vq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 16 May 2025 20:39:24 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-af9564001cbso1619176a12.3
        for <ath12k@lists.infradead.org>; Fri, 16 May 2025 13:39:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747427962; x=1748032762;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Dsl1htn5szVmt/DjssSO8gALKifNfg7gundf833ygfU=;
        b=LcHRvlZqo7oLbAr5OwRPFwByZTQo1e2FHSasrYWLJuO1dtEaS1qYCCq6tmMuzsD4qF
         24xspizEDiPN9A8jk/v0n0QY9Am5dhfnEXmND58Re4km3CtJVsAx3szkHFDTmqR6Cfk2
         UvyfXccZcB+zv0udFfSQzUO3fUZJNqNluiUNMibzS6/NnzrzWI/rCnu7r+eE+5rE9Ubw
         YI9KNzJwcC8LNzL77x+XC5BMqBh7p+nrhev8J8cVStF/p3n+f7fUNDEZBYyBqtkLAJCe
         tJrrEcnp+a8Twqqjruvhv5pj1H9dou+7PBtcUhBJThbFGjVUES2pRA+EwVSTsp4lWwCO
         U2WA==
X-Forwarded-Encrypted: i=1; AJvYcCXfcBi7X/YTUKzYoBQ7L30/OMULYxfySxafwbll6AtZ609Jf3Ecl8o/rxLt5wlyK+82DS7G9ro=@lists.infradead.org
X-Gm-Message-State: AOJu0YzlrEcYRR4gqIArO1LIAXYQGHQVoh/+BxSBSAeNGO/ldnxBMWFH
	sQumvnLNIMwOQbKmg4gyP0Yh10EzPZOl375SXLHinNYRyeF3YXS+veKc1GzGkWp31wm+T3iJGQN
	+6yy7b133Ghavryz54UM3dnuxaEdjZpQDyx/sQFKAVTukOdtDSIJRZJpg8BdeQM4zYW1A+1Mb
X-Gm-Gg: ASbGncuW1/xSpHq579pzesnRKYg5KiFMcbGyaw8E2Urr2KTFpySfrUkhyEG8XJ37KJV
	i6waoxsQgw4ZCvmUZWHo+CEhcXI4AwX5HrQs0ynzaZ0czEYib2Zl9oi6Bq3KYhfgjI/ifR6mvBS
	p54MMG6Up9QkjBkIf1bXPyLVC9AknGXwBSouipP6o4Z+IhmmPoIVDnWUhG3/lAGB9iVqJ3SP2on
	E4PKt9Vwm8+K7kTU5Edz/MouhtjRiq/gs9ktNQybq9ViFDUh1lhNAPphskvH2guh++zMAhER2O3
	ep24u9EA7FUlS9CCZRI4HMyFc5NF2uzOTraiv2xywyf3rmAV
X-Received: by 2002:a05:6a21:3292:b0:1f5:535c:82d6 with SMTP id adf61e73a8af0-21621a23ed5mr6962660637.35.1747427962564;
        Fri, 16 May 2025 13:39:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGdnqDBYsy4Rfl/9bwENaxiqyNWk+xvOv+FgTF257ZoHBlElCFKl3HqX8MypcZD9JkWMDAD5g==
X-Received: by 2002:a05:6a21:3292:b0:1f5:535c:82d6 with SMTP id adf61e73a8af0-21621a23ed5mr6962625637.35.1747427962171;
        Fri, 16 May 2025 13:39:22 -0700 (PDT)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b26eaf6e6a5sm1976743a12.17.2025.05.16.13.39.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 May 2025 13:39:21 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: johannes@sipsolutions.net, ath12k@lists.infradead.org,
        Rameshkumar Sundaram <quic_ramess@quicinc.com>
Cc: linux-wireless@vger.kernel.org
In-Reply-To: <20250327051320.3253783-1-quic_ramess@quicinc.com>
References: <20250327051320.3253783-1-quic_ramess@quicinc.com>
Subject: Re: (subset) [PATCH wireless-next v5 0/4] wifi: cfg80211: update
 EML capabilities of an ML Station
Message-Id: <174742796155.3569414.8147767849529527005.b4-ty@oss.qualcomm.com>
Date: Fri, 16 May 2025 13:39:21 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.0
X-Proofpoint-GUID: 69wyfp6xlX6S33fNBIqpr7jaWDq4uYDd
X-Proofpoint-ORIG-GUID: 69wyfp6xlX6S33fNBIqpr7jaWDq4uYDd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE2MDIwMiBTYWx0ZWRfXymWm+JWHb+4v
 a9zthioWIB2I7+wHis0KMe7kAGvqfJxjXnEkdSBd7GDj2k0+GeMQTCVWeDgrgjqcwMgrit7BaKW
 sTP2PGHZ1OmDjhYAHM8y6Y0SxlF/4TY2YG43d9ACLg2eC8SJaB4/19DS4JjyueRsiHZAHPnZFbH
 uyP9Wb6rIzISddzVvYlsMEXhNYX+O3eVAJSmwrAuzwJW4ul0ElkfY2u5TBQj0JPwe2FAfqJHRbk
 TslxA0S3WAvLMAcAEH8Ph+bSBAiv+ITjCD30rgZYbyx8x/lrPfcvslxQk2uWXHbLy11r0TB04e8
 OVJLw6LMoOV6syBo/0DBXRfVSz3sDedRSv/ob5ifr3cRZanwusgYD29+SHsFTNtu4qSGOk4kfN0
 l6UScWXb5pCAqk6xUFsX4ao3BJ1TjF3a4YCQcFHClVM7+bN9TKfR2Oiwju+jSp4DAdZ2teUP
X-Authority-Analysis: v=2.4 cv=Gp9C+l1C c=1 sm=1 tr=0 ts=6827a27c cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=m0kTWXEf_8-Jg5hTxMkA:9
 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-16_07,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0 impostorscore=0
 bulkscore=0 adultscore=0 suspectscore=0 priorityscore=1501 mlxscore=0
 malwarescore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505160202
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250516_133925_937676_D1899D83 
X-CRM114-Status: UNSURE (   9.71  )
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


On Thu, 27 Mar 2025 10:43:16 +0530, Rameshkumar Sundaram wrote:
> When EMLSR is enabled for an ML association, the EML capabilities
> advertised by the ML Station needs to be updated to drivers in order to
> trigger EMLSR operation.
> Add support to fetch EML capabilities advertised by ML station and
> cache it in ieee80211_sta data structure so that drivers can use them
> whenever required.
> 
> [...]

Applied, thanks!

[4/4] wifi: ath12k: update EMLSR capabilities of ML Station
      commit: 4bcf9525bc49d2ee2fa17950a26c43a90ca006ba

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


