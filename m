Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C12AC3ABD8
	for <ath12k@archiver.kernel.org>; Fri, 16 May 2025 19:40:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1dsDs631HdzngiwCSPmiub7XN25JZzjnVP9wtjNYdQ8=; b=4l4tslii1fB/OKNfy92S+0a7ib
	qamTYacJIY7sc+SuHE7fGjabAr1iuiY4CP8fniL43Fw6it9g9+efcLih3HiU3WS9oncZZgK219sVu
	Plwj24ta0EfNNKe7gnxEY+0AwBSX0YsKPaNzwhPI+0wHYhYqyRfN1zgomf9nJVz43wdyBcF+pMviL
	nE4HfYoIBM0birMKaE/nYc1aDtupE/Tm2LAtpIWL4Xxb55FPM7VtMVgS9kDapNO2Tz8iTq59nmihU
	DbTQtqCLEF/rO6SoRU7EK7WSzc10zQDf+lgHrQqAbdrRTnjUCq9z8gunN9JUtpZz5lCSFgJk5MZme
	zNACYSBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uG0v7-00000004Tty-2onH;
	Fri, 16 May 2025 19:40:37 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uG0v4-00000004Tpf-0SHJ
	for ath12k@lists.infradead.org;
	Fri, 16 May 2025 19:40:35 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54GGrsl7030116
	for <ath12k@lists.infradead.org>; Fri, 16 May 2025 19:40:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1dsDs631HdzngiwCSPmiub7XN25JZzjnVP9wtjNYdQ8=; b=M+eZWZpueKtBq1IT
	3ywdNaR+tgAn6PIm8PN3YXACUpk/JJYhKkgJNDwTaBAdG8fhs4uO9lvJN4ht/y+H
	nJCHTyxjq9akeqmNzSu6NRD7ySgMJA4fYgtpTH5pRG1D32fhLePL3Jhnb7ugZ1gB
	oMSTb0UFYjFDpy0qN12AjlOjXqGH+vlhiUUqFYYnBLQ+/puFM1XQBDDfuV9Viu3e
	41miN6ndKOMHYhi3lgbzar2dbyxQ/7d7mQ3YAtX8/kieq24/8rtc7XrYdKBlHZ7f
	FoqNqFZpIyzHmfjeH2hqVe1j4riBrFSeOmPgQ4M3cgvcGSoI7Q9S/GWyoSajJ42S
	yYatwg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46p997gbrb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 16 May 2025 19:40:33 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-22e6c82716dso19745935ad.0
        for <ath12k@lists.infradead.org>; Fri, 16 May 2025 12:40:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747424432; x=1748029232;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1dsDs631HdzngiwCSPmiub7XN25JZzjnVP9wtjNYdQ8=;
        b=RFylxU/1+vUUkjsn2LohcuEPzIThSEhiAoRmXC0565B9S6jU0fevq4al6rAWudLlN9
         B5ITUryZCSAm+M8Upcz43DtGXq37/TnuBZWzCaH6d6pZjg7ccI9KEsM6qbILAV7Sfg8g
         ti1/THky9ug0vuPlkg/y+30GEDHSRt9Yn9HvvwMmFmC7eAsy2aMjq1Bcz+k0Fc4YVXAf
         aOtPpanA2jME+jpxyKN8XWwI5B+IxMp54y3s/80uLnZIV/u3IkhJ8FbU2yNQCVor3dsJ
         C6QBR+524E1BsPsKj7iMJZv3wViObJDEjVO5x9fatVCMngV6EH/vLIEukfZrIGDoclrd
         3tqA==
X-Gm-Message-State: AOJu0YxL8cSf9pBOYCsv6u1anEfM7fW9s2ytT+gg1VpgLndCOrrKvnNh
	ZASn1O1wau2M6atys7XOfCtJMrWFqRWXPkXMZyBeFRweWMcJrhNUlRHGJO4O+U23tIeCHLWd2KM
	wCw0KgJF1db0QL3PSFN1FCCuZ18/acVYmXE+9SGOUBQk8uFic8zmw6UnEhN/IqKlNvyysSQTe
X-Gm-Gg: ASbGncsH7IpB10kZeY0z5J1P5ME0QWVi8djLmhg+85/OSvctYHmY9hw51BzJ3gTLmvs
	UD61pPyPH04lJpX9EidlGavv06qOiPCaTaphOAteS5T6UvCTUCCp/RNCcDmrgwJ8/IDXBQ8umry
	iInCDr0VuwIRb8RbAx4gAZTFFlS8utMSyoB8U24tKUGReTa7yOCXAAXjnd3RytRfg058IGHeWwc
	VYJTQ1/p1Jvm2D6Wtxnz0HRq5G2uL/jVfiKx8npQIDEeHsthwvhb2yM7GoCnMTXMlciU/YAD7nU
	0UhDlNYIMzHHMDpZWY7OEw/7tEP6i0VTWzcsQavQnfW3jqqO
X-Received: by 2002:a17:902:d2c9:b0:231:c9bb:60f8 with SMTP id d9443c01a7336-231c9bb70ffmr70079345ad.7.1747424432615;
        Fri, 16 May 2025 12:40:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHic32aBxSJ3QdKs82sAE6/YJvBcHpICFqViK2RJ5pmnLswkj6YggBE5ME+bzL4+Skotui04g==
X-Received: by 2002:a17:902:d2c9:b0:231:c9bb:60f8 with SMTP id d9443c01a7336-231c9bb70ffmr70079125ad.7.1747424432202;
        Fri, 16 May 2025 12:40:32 -0700 (PDT)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4e97798sm17955255ad.147.2025.05.16.12.40.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 May 2025 12:40:31 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: ath12k@lists.infradead.org,
        Nithyanantham Paramasivam <nithyanantham.paramasivam@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org,
        Thiraviyam Mariyappan <quic_tmariyap@quicinc.com>
In-Reply-To: <20250422094255.131226-1-nithyanantham.paramasivam@oss.qualcomm.com>
References: <20250422094255.131226-1-nithyanantham.paramasivam@oss.qualcomm.com>
Subject: Re: [PATCH ath-next] wifi: ath12k: Enable AST index based address
 search in Station Mode
Message-Id: <174742443150.3316767.7243329584051307853.b4-ty@oss.qualcomm.com>
Date: Fri, 16 May 2025 12:40:31 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.0
X-Authority-Analysis: v=2.4 cv=U7uSDfru c=1 sm=1 tr=0 ts=682794b1 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=FBhK97DmYzCrVHyfCLwA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE2MDE5MyBTYWx0ZWRfX3apeITchvEZ2
 JET7ENMt2tNJOLZQaeVEsKBc19OpBwkifIEhNW9fr7s/YbgiVTdpLfFik3C/vVBVXbSbhrfDtdA
 CHE1xEmiiXTi7vTW6SAWxJfxxRNwaaB4G6X8vttkwN5Ey4LinbZnLA8/uaDaeKLDTbsACp90HNL
 QoV6NItijLvzbXMyJZqFXiSdqJmdcQqYhD1i16KIyafbHUt7haMEGwjytWinVAXbmg2IqIS+FQ0
 GmVtp2/N0gg2Nfr/gvThuGs40DYM+RjY2McuDk0S4mDfBV+6ROBKHdesvwDxCBL04YBWP+Z7cQM
 1wOL4waBMwkTFZmkq1AlIA7Fxrr3hCGNLZ0O0P5eRrSmBkp87ao6U7zJKUPszSfN61jYqONWYhh
 lgteWRwB27WYkOWTu85etuvZssqISfMB6Ju+ZwxN9LlJl+8p6CzcABu1lGk6+BgpT+RviLII
X-Proofpoint-GUID: IxtAbVdwlUeInAfNFnNNryKm7CZpKLri
X-Proofpoint-ORIG-GUID: IxtAbVdwlUeInAfNFnNNryKm7CZpKLri
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-16_06,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 mlxscore=0 bulkscore=0 spamscore=0 phishscore=0
 impostorscore=0 priorityscore=1501 adultscore=0 mlxlogscore=718 clxscore=1015
 lowpriorityscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505160193
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250516_124034_156202_CBCFC775 
X-CRM114-Status: UNSURE (   7.18  )
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


On Tue, 22 Apr 2025 15:12:55 +0530, Nithyanantham Paramasivam wrote:
> Currently, TCL performs the TX address search for each entry during
> transmission, which may lead to packet delays.
> 
> To mitigate this issue, enable AST index-based address search during
> transmission in station mode. This AST index-based search is not
> enabled in AP mode due to the complexity involved in fetching peer
> information.
> 
> [...]

Applied, thanks!

[1/1] wifi: ath12k: Enable AST index based address search in Station Mode
      commit: 55cbbf25fbde8ed713a55a29f399adda8540e135

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


